extends AccelerationProvider

@export var g := Vector2(0, 980)

func eval(t: float, caller) -> Vector2:
	return g
