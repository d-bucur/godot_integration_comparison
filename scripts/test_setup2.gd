extends Node

@export var tps: int

func _ready() -> void:
	Engine.physics_ticks_per_second = tps
