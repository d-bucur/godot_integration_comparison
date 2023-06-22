extends AccelerationProvider

class_name Oscillator

@export var k: float

func eval(_t: float, pos: Vector2) -> Vector2:
	return -pos * k

func get_period() -> float:
	return PI * 2 / sqrt(k)