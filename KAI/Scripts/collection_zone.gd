extends Node2D

var box_scene = preload("res://Scenes/Box.tscn")
@onready var spawn_point1 = get_parent().get_node("Respawn1")
@onready var spawn_point2 = get_parent().get_node("Respawn2")
@onready var spawn_point3 = get_parent().get_node("Respawn3")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().is_in_group("box"):
		Global.carryingBox = false
		Global.stage1Score += 1
		area.get_parent().queue_free()
		$Timer.start()
		Global.collected = true
		
		

func _on_timer_timeout() -> void:
	if Global.collected == true:
		var pos = randi_range(1, 3)
		var nova_kutija = box_scene.instantiate()
		get_parent().add_child(nova_kutija)
		if pos == 1:
			Global.collected = false
			nova_kutija.global_position = spawn_point1.global_position
		elif pos == 2:
			Global.collected = false
			nova_kutija.global_position = spawn_point2.global_position
		elif pos == 3:
			Global.collected = false
			nova_kutija.global_position = spawn_point3.global_position
	
