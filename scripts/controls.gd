extends Node

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("speed_1"):
		Engine.time_scale = 1
	if Input.is_action_just_pressed("speed_2"):
		Engine.time_scale = 2
	if Input.is_action_just_pressed("speed_3"):
		Engine.time_scale = 3
	if Input.is_action_just_pressed("speed_4"):
		Engine.time_scale = 4
	if Input.is_action_just_pressed("speed_5"):
		Engine.time_scale = 5
