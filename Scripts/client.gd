class_name client
extends Node

var recettes = []
var ingredients: Dictionary = { "cabbage":0, "steak":0, "cheese":0, "tomato":0, "bread":0 }

func increase_ingredient(ingredient: String, increment: int) -> void:
	ingredients[ingredient] += increment
	pass

func cook(recipe: Recipe) -> void:
	var cant_cook = false
	var needed_ingredients = recipe.get_ingredients()
	for ingredient in needed_ingredients:
		if ingredients[ingredient] < needed_ingredients[ingredient] :
			cant_cook = true
	if (cant_cook):
		pass
	
	for ingredient in needed_ingredients:
		ingredients[ingredient] -= needed_ingredients[ingredient]
	pass

func left_overs() -> int:
	var penalty = 0
	for ingredient in ingredients :
		penalty += ingredients[ingredient]
	return penalty

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
