extends Node2D

@export var linear_velocity := Vector2(200, -2000)

var acceleration := Vector2.ZERO
var sleeping := false

func add_force(f: Vector2):
	acceleration += f  # weightless

func _physics_process(dt: float) -> void:
	if sleeping:
		return
	# TODO how to sync with external force on current frame? changing priority on each script is error prone
	position += linear_velocity * dt
	linear_velocity += acceleration * dt
	acceleration = Vector2.ZERO
