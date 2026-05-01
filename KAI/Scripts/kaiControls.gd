extends CharacterBody2D

var sinceRest=0
var DefaultSPEED = 400 * Global.speedUpg
var Speed= DefaultSPEED
var pressed_actions = []
const directions = { &"left": Vector2(-1, 0), &"right": Vector2(1, 0), &"up": Vector2(0, -1), &"down": Vector2(0, 1) }
@onready var anim = $AnimatedSprite2D


@onready var col_node = $CollisionShape2D

var last_direction: Vector2

func _ready() -> void:
	add_to_group("player")
	anim.play("idle_forward")

func _process(delta):
	if Global.STAGE2 == true:
		Global.speedUpg = 1.5
	if Global.STAGE3 == true:
		col_node.shape.set_deferred("size", Vector2(1000, 750))	
		print("PROMENA! Nova veličina kolizije je: ", col_node.shape.size)
		
	
	print(Speed)
	print(Global.speedUpg)
	Global.velocity=velocity
	Speed = max(0,400.0*Global.speedUpg-sinceRest*0.5)
	if Global.carryingBox==true:
		sinceRest+=1
	else:
		sinceRest=0
	for d in directions:
		if Input.is_action_just_pressed(d):
			pressed_actions.push_back(d)
		if Input.is_action_just_released(d):
			pressed_actions.erase(d)
	var direction = Vector2.ZERO if pressed_actions.is_empty() else directions[pressed_actions[-1]]
	if direction:
		velocity = direction*Speed
		Global.velocity=velocity
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
