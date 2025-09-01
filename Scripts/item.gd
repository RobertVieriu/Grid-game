extends Resource

class_name Item 

@export var name : String
@export var isStackable : bool
@export var count : int
@export var weight : float
@export var value : float

# Tags (categories). Example: ["food"], ["weapon"], ["food", "weapon"]
@export var tags : Array[String] = []

# Components (attach if an item is food, weapon, etc.)
@export var food: Food
@export var weapon: Weapon

func use(target) -> void:
	pass
