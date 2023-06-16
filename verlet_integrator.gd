extends Node2D

@export var linear_velocity: Vector2
@export var acceleration: Vector2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position += delta * (linear_velocity + delta * acceleration / 2.0);
	linear_velocity += delta * acceleration;
