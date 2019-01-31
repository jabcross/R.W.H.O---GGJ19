extends KinematicBody2D

var weight = 40
var speed = Vector2(0,0)

func _ready():
	$Sprite.frame = randi() % 2

func _physics_process(delta):
	speed.y += weight * delta
	var collision = move_and_collide(speed*delta)
	if collision:
		if collision.collider == Global.character and not Global.transitioning:
			Global.character.die()
		queue_free()