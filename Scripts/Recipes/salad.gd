class_name salad
extends Recipe

var needed_ingredients: Dictionary = { "cabbage":1, "tomato":1 }

func check_recipe() -> void :
	print("Needed ingredients for burger :")
	
	var str;
	for ingredient in needed_ingredients:
		print("%s : %i\n" % ingredient % needed_ingredients[ingredient])
	print("\n")
	pass

func get_ingredients() -> Dictionary :
	return needed_ingredients

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
