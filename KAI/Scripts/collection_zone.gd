extends Node2D

var box_scene = preload("res://Scenes/Box.tscn")
var box_scene2 = preload("res://Scenes/box_2.tscn")
var box_scene3 = preload("res://Scenes/box_3.tscn")
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
	if area.get_parent().name == "Box":
		Global.carryingBox = false
		Global.stage1Score += 1
		Global.collected -= 1
		Global.occ1 = false
		area.get_parent().queue_free()
		$Timer.start()
	elif area.get_parent().name == "Box2":
		Global.carryingBox2 = false
		Global.stage1Score += 1
		Global.collected -= 1
		Global.occ2 = false
		area.get_parent().queue_free()
		$Timer.start()
	elif area.get_parent().name == "Box3":
		Global.carryingBox3 = false
		Global.stage1Score += 1
		Global.collected -= 1
		Global.occ3 = false
		area.get_parent().queue_free()
		$Timer.start()
		

func _on_timer_timeout() -> void:
	if Global.maxCollected > Global.collected:
			var pos = randi_range(1, 3)
			if pos == 1 and Global.occ1 == false:
				var nova_kutija = box_scene.instantiate()
				nova_kutija.name = "Box"
				get_parent().add_child(nova_kutija)
				nova_kutija.global_position = spawn_point1.global_position
				Global.collected += 1
				Global.occ1 = true
			elif pos == 2 and Global.occ2 == false:
				var nova_kutija2 = box_scene2.instantiate()
				nova_kutija2.name = "Box2"
				get_parent().add_child(nova_kutija2)
				nova_kutija2.global_position = spawn_point2.global_position
				Global.collected +=1
				Global.occ2 = true
			elif pos == 3 and Global.occ3 == false:
				var nova_kutija3 = box_scene3.instantiate()
				nova_kutija3.name = "Box3"
				get_parent().add_child(nova_kutija3)
				nova_kutija3.global_position = spawn_point3.global_position
				Global.collected +=1
				Global.occ3 = true
