extends KinematicBody2D

export(int) var height = 100

var last_position

func animate():
	while true:
		move_up()
		yield($Tween,"tween_completed")
		move_down()
		yield($Tween,"tween_completed")



func move_up():
	$Tween.interpolate_property(self,"position:y",position.y,position.y-height,4,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	$Tween.start()
	
func move_down():
	$Tween.interpolate_property(self,"position:y",position.y,position.y+height,4,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	$Tween.start()