@tool
extends TileMapLayer

@export var generateTerrain : bool
@export var clearTerrain: bool

@export var map_Width : int
@export var map_Height : int

@export var terrainSeed : int

@export var grassThreshold : float
@export var grassTallThreshold : float
@export var dirtThreshold : float
@export var rockThreshold : float


func _ready():
	pass


func _process(delta):
	if generateTerrain:
		generateTerrain = false
		GenerateTerrain()

	if clearTerrain:
		clearTerrain = false
		clear()


func GenerateTerrain():
	print("Generating Terrain...")
	
	var noise = FastNoiseLite.new()
	noise.noise_type = FastNoiseLite.TYPE_CELLULAR
	
	var rng = RandomNumberGenerator.new()
	
	if terrainSeed == 0:
		noise.seed = rng.randi()
	else:
		noise.seed = terrainSeed
	
	for x in range(map_Width):
		for y in range(map_Height):
			if noise.get_noise_2d(x, y) > grassThreshold:
				set_cell(Vector2i(x, y), 0, Vector2i(0, 0), 0)
			elif noise.get_noise_2d(x, y) > grassTallThreshold:
				set_cell(Vector2i(x, y), 0, Vector2i(1, 0), 0)
			elif noise.get_noise_2d(x, y) > dirtThreshold:
				set_cell(Vector2i(x, y), 0, Vector2i(2, 0), 0)
			elif noise.get_noise_2d(x, y) > rockThreshold:
				set_cell(Vector2i(x, y), 0, Vector2i(3, 0), 0)
			else:
				set_cell(Vector2i(x, y), 0, Vector2i(0, 1), 0)
