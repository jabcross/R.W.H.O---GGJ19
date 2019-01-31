extends Node2D
	
func set_open(is_open):
	visible = not is_open
	$StaticBody2D/CollisionShape2D.disabled = is_open