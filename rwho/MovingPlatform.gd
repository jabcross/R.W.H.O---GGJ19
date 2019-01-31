extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(int) var distance = 100.0;
export(int) var duration = 2.0;

var hspeed

var last_x = 0.0

var going_left = false

var initial_x
# Called when the node enters the scene tree for the first time.

func _ready():
	initial_x = position.x
	
func _physics_process(delta):
	hspeed = distance / duration
	if going_left:
		hspeed *= -1.0
		
	position.x += delta * hspeed
	if position.x <= initial_x or position.x >= initial_x + distance:
		going_left = not going_left
		
	last_x = position.x
	