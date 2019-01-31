extends Node2D

func _ready():
	Global.startscreen.get_node("CanvasLayer/CRT").visible = true
	for child in $Elevator1.get_children():
		child.animate()
	yield(get_tree().create_timer(2),"timeout")
	for child in $Elevator2.get_children():
		child.animate()
	yield(get_tree().create_timer(2),"timeout")
	for child in $Elevator3.get_children():
		child.animate()

func _process(delta):
	if Input.is_action_just_pressed("ui_enter"):
		restart()

func restart():
	if Global.transitioning:
		return
	Global.transition.fade_to(1.0,0.5)
	yield(Global.transition,"done")
	queue_free()
	get_parent().add_child(preload("res://Level2.tscn").instance())
	Global.transition.fade_to(0.0,0.5)
