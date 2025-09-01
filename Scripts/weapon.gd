extends Resource

class_name Weapon

var rng = RandomNumberGenerator.new()
var attack_weight = PackedFloat32Array()

enum WeaponRole {MELEE = 0, PROJECTILE = 1, THROW = 2}
enum WeaponClass {DAGGER = 0, SWORD = 1, AXE = 2, MACE = 3, SPEAR = 4, POLEARM = 5, BOW = 6, CROSSBOW = 7, SLING = 8}
var weaponAttacks : Array[String]
var averageDamage : float #DON'T EDIT! WILL BE AVRG DMG OF ALL MOVES
var averagePenetration : float #DON'T EDIT! WILL BE AVRG PEN OF ALL MOVES

@export var weaponRole : WeaponRole
@export var weaponClass : WeaponClass #ex Sword, Crossbow, Dagger
@export var weaponDamage : float
@export var weaponPenetration : float
@export var weaponParry : float
@export var weaponReach : float #MELEE VALUE ONLY
@export var weaponRange : float #RANGED VALUE ONLY
@export var isMelee : bool
@export var isRanged : bool
@export var numberOfHandsNeeded : int #PUT 1 OR 2 UNLESS NEW STUFF ADDED


func HowMuchPercentage(): #ONLY TO SEE THE CHANCE OF EACH ATTACK
	print("The attack is: ", weaponAttacks[rng.rand_weighted(attack_weight)])
	var totalNumber = 0.0
	var i = 0
	
	for weight : float in attack_weight:
		totalNumber += weight
	
	for weight : float in attack_weight:
		print(weaponAttacks[i], " chance is: ", weight / totalNumber * 100)
		i += 1


func WeaponAttack():
	pass
