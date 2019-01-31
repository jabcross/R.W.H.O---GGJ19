extends Node2D

export(int) var timer
export(Texture) var texture

var debris = preload("res://FallingDebris.tscn")

func _ready():
	spawn_debris()
	cycle()

func cycle():
	while true:
		$Tween.interpolate_property(self,"position:x",self.position.x, self.position.x + 180, 4, Tween.TRANS_LINEAR,Tween.EASE_IN)
		$Tween.interpolate_property(self,"position:x",self.position.x + 180, self.position.x, 4, Tween.TRANS_LINEAR,Tween.EASE_IN,4)
		$Tween.start()
		yield(get_tree().create_timer(8),"timeout")

func spawn_debris():
	var new_debris = debris.instance()
	get_parent().call_deferred("add_child",new_debris)
	new_debris.position = self.position+Vector2(0,2)
	get_tree().create_timer(timer).connect("timeout",self,"spawn_debris")