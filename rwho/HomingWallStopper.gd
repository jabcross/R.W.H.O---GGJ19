extends Area2D

func _process(delta):
	for area in get_overlapping_areas():
		if area == $"../HomingWall":
			area.hspeed = 0