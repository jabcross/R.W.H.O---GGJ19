extends Node2D

var label: Label

func _ready():
	Global.label = self
	settext("The quick brown fox jumps over the lazy dog")
	

func settext(string):
	Global.label.text = ""
	for character in string:
		Global.label.text += character
		yield(get_tree().create_timer(0.2),"timeout")