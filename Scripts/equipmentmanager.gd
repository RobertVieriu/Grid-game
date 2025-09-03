extends Node
class_name EquipmentManager

@export var equipmentData : EquipmentData

func equip(slot: BodyPart, item: Item) -> bool:
	# check if the item has any of the required tags
	var hasTag = false
	for tag in item.tags:
		if tag in slot.allowed_tags:
			hasTag = true
			break
	if not hasTag:
		return false
	
	# check if the slot is empty, if yes, unequip
	if equipmentData.equipped.get(slot, null) != null:
		#send item to inventory
		pass
	
	equipmentData.equipped[slot] = item
	return true


func unequip(slot: BodyPart) -> bool:
	#if not cursed
	#if isUnequipable
	return true
