extends Node2D

@onready var terrain = $"../Terrain"

var astar_grid = AStarGrid2D.new()

var path = []
@export var start : Vector2i
@export var end : Vector2i
@export var calculate : bool

func _ready():
	InitPathfinding()
	

func _draw():
	if len(path) > 0:
		for i in range(len(path) - 1):
			draw_line(path[i], path[i+1], Color.PURPLE)


func _process(delta):
	if calculate:
		calculate = false
		InitPathfinding()
		FindPath()


func FindPath():
	path = astar_grid.get_point_path(start, end)
	
	queue_redraw()


func InitPathfinding():
	astar_grid.region = Rect2(0, 0, terrain.map_Width, terrain.map_Height)
	astar_grid.cell_size = Vector2(16, 16)
	astar_grid.update()
	
	for x in range(terrain.map_Width):
		for y in range(terrain.map_Height):
			astar_grid.set_point_weight_scale(Vector2i(x, y), GetTerrainDifficulty(Vector2i(x, y)))
			#astar_grid.set_point_solid(Vector2i(x ,y)) #walls
			print(GetTerrainDifficulty(Vector2i(x, y)))


func GetTerrainDifficulty(coords: Vector2i):
	var source_id = terrain.get_cell_source_id(coords)
	var source: TileSetAtlasSource = terrain.tile_set.get_source(source_id)
	var atlas_coords = terrain.get_cell_atlas_coords(coords)
	var tile_data = source.get_tile_data(atlas_coords, 0)
	
	return tile_data.get_custom_data("walk_difficulty")
