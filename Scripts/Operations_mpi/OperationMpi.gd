extends Node2D

var draggable = false
var mouse_offset = Vector2(0, 0)
var pos_originelle
var areas_in = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pos_originelle = position
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if draggable:
		follow_mouse()

func follow_mouse():
	position = get_global_mouse_position() + mouse_offset

var mouse_entered = false
func _on_area_2d_mouse_shape_entered(shape_idx: int) -> void:
	mouse_entered = true

func _on_area_2d_mouse_shape_exited(shape_idx: int) -> void:
	mouse_entered = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and mouse_entered:
			mouse_offset = position - get_global_mouse_position()
			draggable = true
		else:
			draggable = false
			
			# find which zone the operation is
			if !areas_in.is_empty():
				var difference = Vector2.ZERO
				var max_area
				for a in areas_in:
					if difference > (a.position - position) ** 2:
						difference = (a.position - position) ** 2
						max_area = a
				
				# obvious bug we start somewhere
				position = max_area.position
			else:
				position = pos_originelle
	
	pass # Replace with function body.

func _on_area_2d_area_entered(area: Area2D) -> void:
	print("blabla")
	print(area.get_parent())
	print(area)
	areas_in.append(area)
	pass # Replace with function body.

func _on_area_2d_area_exited(area: Area2D) -> void:
	print("plopplop")
	print(area.get_basename())
	print(area)
	# find the area and remove it
	areas_in.pop_at(areas_in.find(area))
	pass # Replace with function body.
