extends Node

class_name TestSetup

## physics_ticks_per_second value
@export var tps: int = 60
# https://www.wolframalpha.com/input?i=y1%3D637%3B+y0%3D589%3B+v0%3D-2000%3B+a%3D980%3B+solve+1%2F2*a*t%5E2+%2B+v0*t+%2B+y0+-+y1+%3D+0+
## expected time calculated by resolving the motion equation
## 1/2*a*t^2 + v0*t + y0 - y1 = 0
@export var expected_time: float = 4105.49
# https://www.wolframalpha.com/input?i=minimize+1%2F2*980*t%5E2+%2B+-2000*t+%2B+589+for+t
@export var expected_y: float = -1451.8


func _ready() -> void:
	Engine.physics_ticks_per_second = tps
