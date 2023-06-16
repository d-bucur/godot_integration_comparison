extends Line2D

@export var max_points: int = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	add_point(get_parent().global_position)
	if max_points > 0 and points.size() > max_points:
		remove_point(0)