extends Area2D

func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_DOWN and event.pressed == true:
			if Global.character in get_overlapping_bodies():
				Global.character.global_position.x = global_position.x