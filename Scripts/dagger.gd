extends Sprite2D

class_name Dagger

@export var item : Item


func _ready() -> void:
	item.weapon.attack_weight = PackedFloat32Array([5.0, 1.0, 0.1])
	item.weapon.weaponAttacks = ["Stab", "Slash", "Handle"]
	print("attack_weight: ", item.weapon.attack_weight)
	item.weapon.HowMuchPercentage()


func WeaponAttack():
	var chosenAttack = item.weapon.weaponAttacks[item.weapon.rng.rand_weighted(item.weapon.attack_weight)]
	var attackDamage
	var attackPenetration
	var attackCooldown
	
	if (chosenAttack == "Stab"):
		attackDamage = item.weapon.weaponDamage
		attackPenetration = item.weapon.weaponPenetration
		attackCooldown = item.weapon.weaponCooldown
	elif (chosenAttack == "Slash"):
		attackDamage = item.weapon.weaponDamage * 0.7
		attackPenetration = item.weapon.weaponPenetration * 0.8
		attackCooldown = item.weapon.weaponCooldown * 1.1
	else:
		attackDamage = item.weapon.weaponDamage * 0.1
		attackPenetration = item.weapon.weaponPenetration * 0.1
		attackCooldown = item.weapon.weaponCooldown * 1.4
		
	return [attackDamage, attackPenetration, attackCooldown]	
