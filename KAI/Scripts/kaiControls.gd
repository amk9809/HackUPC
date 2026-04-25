extends CharacterBody2D


var SPEED = 500.0*Global.speedUpg
var pressed_actions = []
const directions = { &"left": Vector2(-1, 0), &"right": Vector2(1, 0), &"up": Vector2(0, -1), &"down": Vector2(0, 1) }


func _process(delta):
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

	move_and_slide()
