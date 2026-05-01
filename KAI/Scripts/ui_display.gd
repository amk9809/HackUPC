extends Control

# Ovo pronalazi tajmer koji je dete ovog čvora
@onready var moj_tajmer = $Timer 
@onready var labela_za_vreme = $HBoxContainer/Label

var counter: int = 0

func _process(delta: float) -> void:
	if moj_tajmer and labela_za_vreme:
		labela_za_vreme.text = str(int(moj_tajmer.time_left))
	if moj_tajmer.time_left == 0:
		Global.STAGE2 = true


func _on_timer_timeout() -> void:
	counter += 1
	if counter == 1:
		Global.STAGE2 = true
	elif counter == 2:
		Global.STAGE3 = true
	elif counter == 3:
		Global.GAME_END = true
