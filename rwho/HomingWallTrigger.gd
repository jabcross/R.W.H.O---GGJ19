extends Area2D

var triggered = false

func _process(delta):
	if not triggered:
		for body in get_overlapping_bodies():
			if body == Global.character:
				$"../HomingWall".hspeed = 80
				triggered = true
				$"../ShaderLabel/Viewport/Label".text = "Outside is dangerous! I have to get inside!"

