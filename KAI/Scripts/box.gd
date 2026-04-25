extends Node2D

@onready var player=get_tree().get_first_node_in_group("player")
var speed=50*Global.speedUpg

func _ready() -> void:
	add_to_group("box")

func _process(delta: float) -> void:
	if(Global.carryingBox):
		position+=(player.position - position)/speed
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.is_in_group("player")):
		Global.carryingBox=true


	
