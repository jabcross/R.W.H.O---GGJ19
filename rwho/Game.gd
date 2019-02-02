extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("ui_enter"):
		restart()

func _ready():
	$Button.connect("change_state",self,"on_button_change_state")
	Global.startscreen.get_node("CanvasLayer/CRT").visible = true
	$Portal.enabled = true
		
func restart():
	if Global.transitioning:
		return
	Global.transitioning = true
	Global.transition.fade_to(1.0,0.5)
	Global.transition.connect("done",self,"after_black")
	
func after_black():
	Global.goto("res://fase1.tscn")
	queue_free()