extends Node

@export var method_name: String
@export var target: Node2D
@export var finish_line: Node2D
@export var setup: TestSetup

var max_x: float = -1000
var max_y: float = 1000
var time_started = null
var is_stopped = false

func _ready() -> void:
	time_started = Time.get_ticks_msec()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if is_stopped:
		return
	max_x = max(target.global_position.x, max_x)
	max_y = min(target.global_position.y, max_y)
	if (target.global_position.y >= finish_line.global_position.y):
		_on_finished()

func _on_finished():
	var t = Time.get_ticks_msec() - time_started
	var t_error = abs(float(setup.expected_time - t)) / setup.expected_time * 100
	var y_error = abs(setup.expected_y - max_y) / abs(setup.expected_y) * 100
	print("|-----------------------|-----|--------|----------------|--------------|
| method                | tps | max_x  | min_y (%%err)   | time (%%err)  |
| %21s | %3d | %6.1f | %5.1f (%4.01f) | %5d (%4.01f) |" \
	% [method_name, setup.tps, max_x, max_y, y_error, t, t_error])
	is_stopped = true
	target.sleeping = true
