extends AccelerationProvider

@export var k: float

func eval(_t: float, pos: Vector2) -> Vector2:
	return -pos * k
