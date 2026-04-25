extends Control

var zero=0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.velocity.x==0 and Global.velocity.y==0:
		zero=0.0
	$HBoxContainer/Label.text = "V E L O C I T Y: "
	
	$HBoxContainer2/Label2.text =str("%0.2f" %zero)
	zero=lerp(zero,(abs(Global.velocity.x)+abs(Global.velocity.y)+randf_range(-20.0, 0.0)),delta*10)
	pass
