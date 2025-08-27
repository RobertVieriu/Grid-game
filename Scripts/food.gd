extends Item

class_name Food

enum FoodType {OMNIVORE = 0, VEGETARIAN = 1, CARNIVORE = 2, PLANT = 3}
enum FoodQuality {AWFUL = 0, BAD = 1, NORMAL = 2, GOOD = 3, EXCELLENT = 4}

@export var nutrition = 1.0
@export var foodType : FoodType
@export var foodQuality : FoodQuality 
@export var spoilTime : float
