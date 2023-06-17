extends Node2D

## simplified version of G*M
@export var G: float
@export var orbiting_body: Node2D

func _physics_process(delta: float) -> void:
	var r = orbiting_body.global_position - global_position
	# TODO will silently bug out if r is 0
	var g_force = G / r.length_squared() * r.normalized()
	get_parent().apply_central_force(g_force)
