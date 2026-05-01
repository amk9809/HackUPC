extends Control

var zero=0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$HBoxContainer/Label.text = "S T A G E :"
	
	if Global.GAME_START == true and Global.STAGE1 == true and Global.STAGE2 == false and Global.STAGE3 == false:
		$HBoxContainer2/Label2.text = "1."
	elif Global.GAME_START == true and Global.STAGE1 == true and Global.STAGE2 == true and Global.STAGE3 == false:
		$HBoxContainer2/Label2.text = "2."
	elif Global.GAME_START == true and Global.STAGE1 == true and Global.STAGE2 == true and Global.STAGE3 == true:
		$HBoxContainer2/Label2.text = "3."
