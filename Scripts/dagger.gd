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
