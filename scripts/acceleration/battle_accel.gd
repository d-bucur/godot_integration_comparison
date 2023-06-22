extends AccelerationProvider


@export var oscillator: Oscillator
@export var const_g: ConstG
@export var timer: Timer

@onready var active_g: AccelerationProvider = oscillator

func _ready() -> void:
	timer.wait_time = 2 * oscillator.get_period()
	timer.start()

func eval(t: float, pos: Vector2) -> Vector2:
	return oscillator.eval(t, pos) + const_g.eval(t, pos)

func _on_timer_timeout():
	Engine.time_scale *= 1.1
	timer.wait_time = 2 * oscillator.get_period()
	timer.start()