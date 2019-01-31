extends Area2D

enum dir {LEFT, RIGHT}

export(dir) var direction = dir.RIGHT
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	if direction == dir.LEFT:
		go_left()
		yield($Tween,"tween_completed")		
	while true:
		go_right()
		yield($Tween,"tween_completed")
		go_left()
		yield($Tween,"tween_completed")

func go_right():
	$AnimatedSprite.flip_h = true
	$Tween.interpolate_property(self,"position:x",self.position.x,self.position.x + 180, 4, Tween.TRANS_LINEAR,Tween.EASE_IN)
	$Tween.start()
	
func go_left():
	$AnimatedSprite.flip_h = false	
	$Tween.interpolate_property(self,"position:x",self.position.x,self.position.x - 180, 4, Tween.TRANS_LINEAR,Tween.EASE_IN)
	$Tween.start()

func _process(delta):
	if Global.character in get_overlapping_bodies():
		Global.character.die()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
