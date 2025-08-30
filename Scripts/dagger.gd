extends Sprite2D

class_name Dagger

@export var weapon : Weapon


func _ready() -> void:
	weapon.weights = PackedFloat32Array([5, 1, 0.1])
	weapon.weaponAttacks = ["Stab", "Slash", "Handle"]
	print("Weights: ", weapon.weights)
	weapon.HowMuchPercentage()


func WeaponAttack():
	var chosenAttack = weapon.weaponAttacks[weapon.rng.rand_weighted(weapon.weights)]
	var attackDamage
	var attackPenetration
	var attackCooldown
	
	if (chosenAttack == "Stab"):
		attackDamage = weapon.weaponDamage
		attackPenetration = weapon.weaponPenetration
		attackCooldown = weapon.weaponCooldown
	elif (chosenAttack == "Slash"):
		attackDamage = weapon.weaponDamage * 0.7
		attackPenetration = weapon.weaponPenetration * 0.8
		attackCooldown = weapon.weaponCooldown * 1.1
	else:
		attackDamage = weapon.weaponDamage * 0.1
		attackPenetration = weapon.weaponPenetration * 0.1
		attackCooldown = weapon.weaponCooldown * 1.4
		
	return [attackDamage, attackPenetration, attackCooldown]	
