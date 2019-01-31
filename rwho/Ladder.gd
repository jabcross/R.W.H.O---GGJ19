extends Sprite

func _ready():
	$Area2D.connect("body_entered",self,"_body_entered")
	$Area2D.connect("body_exited",self,"_body_exited")

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		if Global.character in $Area2D.get_overlapping_bodies():
			snap()
		
func _body_entered(body):
	if Global.character is Object and Global.character == body:
		body.ladder_count += 1
		if Input.is_action_pressed("ui_up"):
			snap()
		
func _body_exited(body):
	if Global.character == body:
		body.ladder_count -= 1
		
func snap():
	Global.character.position.x = position.x
	Global.character.climbing = true