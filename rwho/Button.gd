extends Area2D

var last_state = false

signal change_state(is_on)

func _process(delta):
	var on = not get_overlapping_bodies().empty()
	if on != last_state:
		last_state = on
		emit_signal("change_state",on)
		on_change_state(on)

func on_change_state(is_on):
	pass