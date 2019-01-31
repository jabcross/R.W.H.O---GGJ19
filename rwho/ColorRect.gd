class_name Transition
extends ColorRect

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal done

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.transition = self
	get_material().set_shader_param("threshold",1.0)
	fade_to(0.0,0.5)

func fade_to(x,duration):
	var material = get_material()
	$Tween.interpolate_property(material,"shader_param/threshold",material.get_shader_param("threshold"),x,duration,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	$Tween.start()
	yield($Tween,"tween_completed")
	emit_signal("done")
