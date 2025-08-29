extends Item

class_name Weapon

enum WeaponRole {MELEE = 0, PROJECTILE = 2, THROW = 3}
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
