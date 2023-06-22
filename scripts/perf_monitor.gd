extends Node

var profiling_enabled := false
var results_interval_msec := 5000
var logs: Dictionary
var last_log: float

func _process(_delta):
	if not profiling_enabled:
		return
		
	if Time.get_ticks_msec() - last_log < results_interval_msec:
		return
	for k in logs.keys():
		var avg = get_avg(k)
		print("%s: avg %f cum %d" % [k, avg[1], avg[0]])
	last_log = Time.get_ticks_msec()
	print("-----------------------")

func log_start(id: String):
	if not profiling_enabled:
		return

	if not id in logs:
		logs[id] = []

	logs[id].push_back([Time.get_ticks_usec()])

func log_stop(id: String):
	if not profiling_enabled:
		return

	logs[id][logs[id].size()-1].push_back(Time.get_ticks_usec())

func get_avg(id: String) -> Array:
	var tot = 0
	for l in logs[id]:
		var dt = l[1] - l[0]
		tot += dt

	return [tot, float(tot) / logs[id].size()]
