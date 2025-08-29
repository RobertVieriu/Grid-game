extends Sprite2D

class_name Dagger

@export var weapon : Weapon
var rng = RandomNumberGenerator.new()
var weights = PackedFloat32Array([5, 1, 0.1])


func _ready() -> void:
	weapon.weaponAttacks = ["Stab", "Slash", "Handle"]
	print(weights)
	HowMuchPercentage()
	CalculateAttack()


func WeaponAttack():
	var chosenAttack = weapon.weaponAttacks[rng.rand_weighted(weights)]
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

func CalculateAttack():
	print(weapon.weaponAttacks[rng.rand_weighted(weights)])


func HowMuchPercentage(): #ONLY TO SEE THE CHANCE OF EACH ATTACK
	var totalNumber = 0.0
	var i = 0
	
	for weight : float in weights:
		print(weight)
		totalNumber += weight
	
	for weight : float in weights:
		print(weapon.weaponAttacks[i], " chance is: ", weight / totalNumber * 100)
		i += 1
