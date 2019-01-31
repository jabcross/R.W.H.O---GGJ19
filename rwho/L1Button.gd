extends "res://Button.gd"

func on_change_state(is_on):
	get_tree().call_group("blue_door","set_open",is_on)