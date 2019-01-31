extends Area2D

var hspeed = 0

func _ready():
	add_to_group("homing_wall")

func _process(delta):
	position.x += hspeed * delta
	if Global.character in get_overlapping_bodies():
		Global.character.die()