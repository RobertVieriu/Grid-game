extends Node

class_name EquipmentManager

@export var equipmentData : EquipmentData

func equip(slot: EquipmentSlot, item: Item) -> bool:
	# create empty list in dictionary if not existent
	if not equipmentData.slot.name in equipmentData.equipped:
		equipmentData.equipped[slot.name] = []
	
	# check if item requires both hands (or more)
	if item.weapon.numberOfHandsNeeded > 1:
		for s in equipmentData.slots:
			if s.name == "Hand" and equipmentData.equipped.has("Hand") and equipmentData.equipped["Hand"].size() > 0:
				print("Can't equip ", item.name)
				return false
	
	# check slot capacity
	if equipmentData.equipped[slot.name].size() >= 1:
		return false
	
	# check tags before equipping
	for tag in item.tags:
		if tag in slot.allowed_tags:
			equipmentData.equipped[slot.name] = item
			return true
	print("Wrong slot for", item.name)
	return false

func unequip(slot: EquipmentSlot) -> void:
	equipmentData.equipped.erase(slot.name)
