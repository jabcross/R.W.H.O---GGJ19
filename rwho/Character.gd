class_name Character
extends KinematicBody2D

var hspeed = 100
var weight = 20
var jump_speed = 300
var speed = Vector2(0,0)
var ladder_count = 0
var ladder_climb_speed = 100
var climbing = false
var pressed_up = false
var respawn

var platform = null

var on_floor = false

func _ready():
	$AnimatedSprite.connect("frame_changed",self,"on_frame_changed")
	$Area2D.connect("body_entered",self,"on_touchdown")
	$Area2D.connect("body_exited",self,"on_liftoff")
	respawn = Node2D.new()
	get_parent().call_deferred("add_child",respawn)
	respawn.global_position = global_position
	Global.character = self

func on_frame_changed():
	if $AnimatedSprite.animation == "walk" and $AnimatedSprite.frame == 2:
		dust()

func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_UP and event.pressed == true:
			pressed_up = true
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		Global.character.position = event.position


func _physics_process(delta):
	if climbing:
		speed.x = 0
	elif Input.is_action_pressed("ui_left"):
		speed.x = -hspeed
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_right"):
		speed.x = +hspeed
		$AnimatedSprite.flip_h = true
	else:
		speed.x = 0
	
	if not climbing:
		if speed.x != 0:
			$AnimatedSprite.play("walk")
		else:
			$AnimatedSprite.play("idle")
	
	if not on_floor and not climbing:
		if speed.y < 0:
			$AnimatedSprite.play("jump")
		else:
			$AnimatedSprite.play("fall")
	
#	if platform != null:
#		print(platform.hspeed)
#		# speed.x += platform.hspeed
	
	if ladder_count == 0:
		climbing = false

	if (climbing or on_floor) and Input.is_action_pressed("ui_accept"):
		speed.y = -jump_speed
		on_floor = false
		climbing = false
	elif climbing:
		speed.y = 0
		if Input.is_action_pressed("ui_up"):
			speed.y = -ladder_climb_speed
		if Input.is_action_pressed("ui_down"):
			speed.y = +ladder_climb_speed
	else:
		if ladder_count > 0 and Input.is_action_pressed("ui_up"):
			speed.y = -ladder_climb_speed
		else:
			speed.y += weight
	move_and_slide(speed,Vector2(0,-1))
	if is_on_floor():
		speed.y = 0
		if on_floor == false:
			dust()
		on_floor = true
		climbing = false
		
	if is_on_ceiling():
		speed.y = 0
		
	if !test_move(global_transform, Vector2(0,1)):
		on_floor = false
		
	if climbing:
		$AnimatedSprite.play("climb")
		if Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down"):
			$AnimatedSprite.playing = true
		else:
			$AnimatedSprite.playing = false
			
func dust():
	var dust = preload("res://Dust.tscn").instance()
	dust.position = position
	$"..".add_child(dust)

func on_touchdown(object):
	if "hspeed" in object and object != self:
		print("connect")
		platform = object
		
func on_liftoff(object):
	if "hspeed" in object and object != self:
		print("disconnect")		
		platform = null


func die():
	$CollisionShape2D.disabled = true
	get_parent().restart()
