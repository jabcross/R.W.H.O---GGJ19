extends Area2D

var enabled := false setget set_enabled
var exited := false

func set_enabled(is_enabled):
	enabled = is_enabled
	if is_enabled:
		$AnimatedSprite.play()
		$AnimatedSprite.modulate = Color(1,1,1,1)

func _ready():
	connect("body_entered",self,"exit")

func exit(body):
	print(body)
	print(Global.character)
	print(body == Global.character)
	print(not exited)
	print(enabled)
	if body == Global.character and not exited and enabled:
		Global.transitioning = true
		exited = true
		Global.transition.fade_to(1.0,0.5)
		yield(Global.transition,"done")
		Global.goto("res://End.tscn")
		$"..".queue_free()
