extends Node
class_name EquipmentManager

@export var equipmentData : EquipmentData

signal equipment_equipped(slot, item, old_item)
signal equipment_unequipped(slot, item)

func equip(slot: BodyPart, item: Item) -> bool:
	# check if the item has any of the required tags
	var hasTag = false
	for tag in item.tags:
		if tag in slot.allowed_tags:
			hasTag = true
			break
	if not hasTag:
		return false
	
	# check if the slot is empty, if not, unequip
	if equipmentData.equipped.get(slot, null) != null:
		#send item to inventory
		unequip(slot, item)
	
	equipmentData.equipped[slot] = item
	print(item.name, " equipped in ", slot.name)
	equipment_equipped.emit(slot, item)
	return true


func unequip(slot: BodyPart, item:Item) -> bool:
	#if not cursed
	#if isUnequipable
	#get signal from inventory
	#if inventory full, drop on ground
	equipment_unequipped.emit(slot, item)
	return true
