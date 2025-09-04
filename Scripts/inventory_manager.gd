extends Node

@export var inventory : Inventory

signal item_added_to_inventory(item)
signal item_removed_from_inventory(item)
signal inventory_full(item)


func add_to_inventory(item) -> void:
	#if inventory == full drop
		#inventory_full.emit(item)
	inventory.append(item)
	print("Added ", item, " to inventory!")
	item_added_to_inventory.emit(item)


func remove_from_inventory(item) -> void:
	for i in inventory.size():
		if inventory[i] == item:
			#code to drop item from the ground
			inventory.remove_at(i)
			item_removed_from_inventory.emit(item)
