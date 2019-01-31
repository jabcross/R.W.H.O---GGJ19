extends KinematicBody2D

var push_speed = 100
var fall_speed = 300
var speed = Vector2(0,0)

func _process(delta):
	
	if not is_on_floor():
		speed.y = fall_speed
		speed.x = 0
	elif Global.character in $RightSide.get_overlapping_bodies() and Input.is_action_pressed("ui_left"):
		speed.x = -push_speed
	elif Global.character in $LeftSide.get_overlapping_bodies() and Input.is_action_pressed("ui_right"):
		speed.x = push_speed
	else:
		speed.x = 0


func _physics_process(delta):
	move_and_slide(speed,Vector2(0,-1))