extends Timer

@onready var animation_player = $"../../AnimationPlayer"
@onready var pic = $"../../heart_beat"

func _ready() -> void:
	wait_time = 61.0 
	start()
	
func _process(delta: float) -> void:
	heart_beat()
	
func heart_beat():
	if time_left < 10:
		animation_player.play("heart_beat")
	else:
		pic.modulate = Color(1.0, 1.0, 1.0, 0.0)
	
