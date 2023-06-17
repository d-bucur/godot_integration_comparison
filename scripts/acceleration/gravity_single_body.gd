extends AccelerationProvider

## simplified version of G*M
@export var G: float
@export var orbiting_body: Node2D

func eval(t: float, caller) -> Vector2:
	var r = orbiting_body.global_position - caller.global_position
	# will silently bug out if r is 0
	return G / r.length_squared() * r.normalized()
