extends CanvasLayer

var purple = Color(0.416, 0.294, 0.702)
var green = Color(0.012, 0.671, 0.0)

@onready var container = $Container
@onready var Text = $Container/Text
@onready var color_rect = $Fade_background
@onready var animation_player = $Fade_anim

func _ready() -> void:
	hide_textbox()
	add_text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.", "AI")
	if Global.STAGE1 == true or Global.STAGE2 == true or Global.STAGE3 == true:
		stage_finished("fade_to_black")
	await get_tree().create_timer(7).timeout
	add_text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.", "Kai")

func stage_finished(anim_name):
	if anim_name == "fade_to_black":
		animation_player.play("fade_to_black")
	else:
		animation_player.play("fade_back")

func transition():
	color_rect.visible = true
	animation_player.play("fade_to_black")

func hide_textbox():
	Text.text = ""
	container.hide()
	
func show_textbox():
	container.show()
	
func add_text(the_text, character):
	if character == "AI":
		Text.set("theme_override_colors/font_color", green)
	else:
		Text.set("theme_override_colors/font_color", purple)
	Text.text = the_text
	Text.visible_ratio = 0
	show_textbox()
	for i in range(len(the_text)):
		Text.visible_ratio =float(1.0/len(the_text)) + Text.visible_ratio
		await get_tree().create_timer(0.05).timeout
