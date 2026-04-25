extends CharacterBody2D


var SPEED = 300.0*Global.speedUpg
var pressed_actions = []
const directions = { &"left": Vector2(-1, 0), &"right": Vector2(1, 0), &"up": Vector2(0, -1), &"down": Vector2(0, 1) }
@onready var anim = $AnimatedSprite2D

var last_direction: Vector2

func _ready() -> void:
	add_to_group("player")
	anim.play("idle_forward")

func _process(delta):
	Global.velocity=velocity
	for d in directions:
		if Input.is_action_just_pressed(d):
			pressed_actions.push_back(d)
		if Input.is_action_just_released(d):
			pressed_actions.erase(d)
	var direction = Vector2.ZERO if pressed_actions.is_empty() else directions[pressed_actions[-1]]
	if direction:
		velocity = direction*SPEED
	else :
		velocity = Vector2.ZERO
		
	if direction == Vector2(0, -1):
		anim.play("back_walk")
		last_direction = Vector2(0, -1)
	elif direction == Vector2(0, 1):
		anim.play("front_walk")
		last_direction = Vector2(0, 1)
	elif direction == Vector2(-1, 0):
		anim.play("side_walk")
		anim.flip_h = false
		last_direction = Vector2(-1, 0)
	elif direction == Vector2(1, 0):
		anim.flip_h = true
		anim.play("side_walk")
		last_direction = Vector2(1, 0)
		
	elif velocity.x == 0 and velocity.y == 0:
		if last_direction == Vector2(0, -1):
			anim.play("idle_back")
		elif last_direction == Vector2(0, 1):
			anim.play("idle_forward")
		elif last_direction == Vector2(-1, 0):
			anim.play("idle_side")
			anim.flip_h = false
		elif last_direction == Vector2(1, 0):
			anim.play("idle_side")
			anim.flip_h = true
	move_and_slide()
