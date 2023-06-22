extends VisibleOnScreenNotifier2D


func _on_screen_exited() -> void:
	print("%s has been eliminated!" % get_parent().name)
	get_parent().queue_free()
