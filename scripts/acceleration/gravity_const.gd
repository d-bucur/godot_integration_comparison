extends AccelerationProvider

class_name ConstG

@export var g := Vector2(0, 980)

func eval(_t, _p) -> Vector2:
	return g
