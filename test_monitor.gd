extends Node

@export var target: Node2D
@export var finish_line: Node2D
## physics_ticks_per_second value
@export var tps: int = 60
# https://www.wolframalpha.com/input?i=y1%3D637%3B+y0%3D589%3B+v0%3D-2000%3B+a%3D980%3B+solve+1%2F2*a*t%5E2+%2B+v0*t+%2B+y0+-+y1+%3D+0+
## expected time calculated by resolving the motion equation
## 1/2*a*t^2 + v0*t + y0 - y1 = 0
@export var expected_time: float = 4105.49

var max_x: float = -1000
var max_y: float = 1000
var time_started = null
var is_stopped = false

func _ready() -> void:
	# Engine.max_fps = fps
	Engine.physics_ticks_per_second = tps
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
	var t_error = abs(float(expected_time - t)) / expected_time
	# print("fps: %d" % fps)
	print("tps: %d" % tps)
	print("jump time: %f" % t)
	print("time error: %f" % t_error)
	print("max_x: %f" % max_x)
	print("max_y: %f" % max_y)
	is_stopped = true
