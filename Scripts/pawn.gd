extends CharacterBody2D

@onready var terrain = $"../Terrain"
@onready var pathfinding = $"../Pathfinding"

@export var inventory : Inventory
@export var equipment : EquipmentManager

const SPEED = 300.0

var path = []


func _ready():
	add_to_group("selectable")
	$Highlight.visible = false
	#var hightlight = load('res://Highlight')
	#$Sprite2D.hightlight = hightlight
	#var hand_slot: EquipmentSlot = equipment.equipmentData.slots[0]
	for item in inventory.item:	
		if item.name == "Dagger":
			equipment.equip(equipment.equipmentData.bodyParts[0], item)
				
		if item.name == "Shortsword":
			equipment.equip(equipment.equipmentData.bodyParts[1], item)

		#for slot in equipment.equipmentData.equipped:
			#print(slot.name, " has the item: " , equipment.equipmentData.equipped[slot].name)


func set_selected(selected: bool):
	$Highlight.visible = selected


func _physics_process(delta):
	
	if Input.is_action_just_pressed("right_click"):
		var pos = position / terrain.rendering_quadrant_size
		var targetPos = get_global_mouse_position() / terrain.rendering_quadrant_size
		
		path = pathfinding.RequestPath(pos, targetPos)
		
	
	if len(path) > 0:
		var direction = global_position.direction_to(path[0])
		var terrainDifficulty = pathfinding.GetTerrainDifficulty(position / terrain.rendering_quadrant_size)
		velocity = direction * SPEED * (1 / terrainDifficulty)
		
		if position.distance_to(path[0]) < SPEED * delta:
			path.remove_at(0)
			
	else:
		velocity = Vector2(0,0)


	move_and_slide()
