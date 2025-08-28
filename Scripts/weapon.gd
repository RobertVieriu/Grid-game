extends Item

class_name Weapon

enum WeaponClass {MELEE = 0, PROJECTILE = 2, THROWN = 3}
enum WeaponType {DAGGER = 0, SWORD = 1, AXE = 2, MACE = 3, SPEAR = 4, POLEARM = 5, BOW = 6, CROSSBOW = 7}

@export var weaponClass : WeaponClass
@export var weaponType : WeaponType #ex Sword, Crossbow, Dagger
@export var weaponReach : float #MELEE VALUE ONLY
@export var weaponRange : float #RANGED VALUE ONLY
@export var isMelee : bool
@export var isRanged : bool
@export var numberOfHandsNeeded : int #PUT 1 OR 2 UNLESS NEW STUFF ADDED
@export var averageDamage : float #WILL BE AVRG DMG OF ALL MOVES
@export var averagePenetration : float #WILL BE AVRG PEN OF ALL MOVES
@export var weaponParry : float
