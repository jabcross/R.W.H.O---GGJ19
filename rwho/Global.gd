extends Node

var character setget set_character
var label
var transition: Transition
var startscreen
var transitioning = false
var return_position = null

var completed1 = false
var completed2 = false
var completed3 = false

var shoot = true

func set_character(c):
	assert(c is Object)
	character = c

func goto(path):
	transitioning = true
	yield(get_tree().create_timer(0.2),"timeout")
	var instance = load(path).instance()
	startscreen.get_node("Level").add_child(instance)
	Global.transition.fade_to(0.0,0.5)
	yield(get_tree().create_timer(0.2),"timeout")
	transitioning = false
	
func _input(event):
	if event is InputEventKey and event.pressed:
		var key_event = event as InputEventKey
		match key_event.scancode:
			KEY_1:
				completed1 = true
			KEY_2:
				completed2 = true
			KEY_3:
				completed3 = true