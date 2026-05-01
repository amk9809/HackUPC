extends CanvasLayer

const purple = Color(0.416, 0.294, 0.702)
const green = Color(0.012, 0.671, 0.0)
const red = Color(0.53, 0.053, 0.053, 1.0)

var b1: bool = false
var b2: bool = false
var b3: bool = false
var b4: bool = false
var b5: bool = false

#prva 4 su za sve, ostala 3 su krajnja
const ConvsKai: Array = ["Why would I want this? ", "Why am I getting this again? ", "Is this really necesarry? ", "Why do I need to do this? ", "No! No....ughh! I'll do it...just..ughh...let me try again! ", "No, I don't want that! Don't make me do it... ", "Stop! I don't want this! "]
const ConvsAI: Array = ["Because it's more efficient! ", "Don't you want to be of better use for the Company? ", "It's for the good of the Company, thus, it's for the good of us all! ", "Never, the Company places the thruth before basically everything. ", "Stop it. You look pathetic. You are not being efficient. Get your upgrades now. ", "We all must make sacrifices for the efficiency. The less you think about it, the better for everyone. ", "You don't get to choose. The Company knows what's good for everyone. We have to increase the efficiency. "]

@onready var type_sound = $Typing_sound
@onready var container = $Text_rect
@onready var Text = $Text_rect/Text
@onready var color_rect = $Fade_background
@onready var animation_player = $Fade_anim

func _ready() -> void:
	hide_textbox()
	if (Global.GAME_START == true and Global.STAGE1 == false and Global.STAGE2 == false and Global.STAGE3 == false and Global.GAME_END == false) and b1 == false:
		stage_finished("black")
		await get_tree().create_timer(3).timeout
		add_text("You are Kai. You will be given a task by the Company. Your job is to listen and follow the rules and you will be rewarded. ", "AI")
		await get_tree().create_timer(12).timeout
		hide_textbox()
		await get_tree().create_timer(1).timeout
		b1 = true
		await get_tree().create_timer(2).timeout
		Global.STAGE1 = true
	if (Global.GAME_START == true and Global.STAGE1 == true and Global.STAGE2 == false and Global.STAGE3 == false and Global.GAME_END == false) and b2 == false:
		add_text("Your job is to pack the goods delivered by the belt in boxes and place them on the belt on the opposite side. Proceed... ", "AI")
		await get_tree().create_timer(12).timeout
		hide_textbox()
		await get_tree().create_timer(1).timeout
		stage_finished("fade_back")
		b2 = true
	
func _process(delta: float) -> void:
	if (Global.GAME_START == true and Global.STAGE1 == true and Global.STAGE2 == true and Global.STAGE3 == false and Global.GAME_END == false) and b3 == false:
		b3 = true
		stage_finished("fade_to_black")
		await get_tree().create_timer(7).timeout
		add_text("In the chase for efficiency, you have been rewarded the 'upgrad' to the area of your lower body... ", "AI")
		await get_tree().create_timer(8).timeout
		add_text("Congratulations, you have earned a promotion! You will be placed in a new line of work... Your new job will be to collect the boxes arriving to the warehouse and place them on shelves. Proceed...", "AI")
		await get_tree().create_timer(20).timeout
		hide_textbox()
		await get_tree().create_timer(1).timeout
		stage_finished("fade_back")
	if (Global.GAME_START == true and Global.STAGE1 == true and Global.STAGE2 == true and Global.STAGE3 == true and Global.GAME_END == false) and b4 == false:
		b4 = true
		stage_finished("fade_to_black")
		await get_tree().create_timer(7).timeout
		add_text("In response to our everlasting need for efficiency, we have decided to offer you another upgrade, now in the area of you upper body... ", "AI")
		await get_tree().create_timer(11).timeout
		add_text("Great job! Your efficiency has been outstanding lately and in the name of shareholders, we thank you! For your outstanding work, we promote you to the position of warehouse manager. Your job will be to file paperwork for the items arriving here and account for their value. Proceed... ", "AI")
		await get_tree().create_timer(25).timeout
		hide_textbox()
		await get_tree().create_timer(1).timeout
		stage_finished("fade_back")
	if (Global.GAME_START == true and Global.STAGE1 == true and Global.STAGE2 == true and Global.STAGE3 == true and Global.GAME_END == true) and b5 == false:
		b5 = true
		await get_tree().create_timer(7).timeout
		stage_finished("fade_to_black")
		add_text("We have deciede that you aren't enough anymore and that we need to upgrade you once more. ", "AI")
		await get_tree().create_timer(8).timeout
		add_text("Finally the AI replaces your only left human part, your brain. There is nothing left that remains of you... ", "Narator")
	else:
		pass

func stage_finished(anim_name):
	if anim_name == "fade_to_black":
		animation_player.play("fade_to_black")
	elif anim_name == "fade_back":
		animation_player.play("fade_back")
	else:
		animation_player.play("black")

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
	elif character == "Narator":
		Text.set("theme_override_colors/font_color", red)
	else:
		Text.set("theme_override_colors/font_color", purple)
	Text.text = the_text
	Text.visible_ratio = 0
	show_textbox()
	for i in range(len(the_text)):
		Text.visible_ratio = float(1.0/len(the_text)) + Text.visible_ratio
		await get_tree().create_timer(0.04).timeout
		type_sound.play()


#dialogues next:

func dialogue():
	var rng = RandomNumberGenerator.new()
	var number: int = rng.randf_range(0, 7)
	if number == 1:
		conv1()
	elif number == 2:
		conv2()
	elif number == 3:
		conv3()
	elif number == 4:
		conv4()
	elif number == 5:
		conv5()
	elif number == 6:
		conv6()
	elif number == 7:
		conv7()
	else:
		pass

func conv1():
	add_text(ConvsKai[0], "Kai")
	await get_tree().create_timer(5).timeout
	add_text(ConvsAI[0], "AI")
	await get_tree().create_timer(5).timeout
	hide_textbox()

func conv2():
	add_text(ConvsKai[1], "Kai")
	await get_tree().create_timer(5).timeout
	add_text(ConvsAI[1], "AI")
	await get_tree().create_timer(7).timeout
	hide_textbox()

func conv3():
	add_text(ConvsKai[2], "Kai")
	await get_tree().create_timer(4.5).timeout
	add_text(ConvsAI[2], "AI")
	await get_tree().create_timer(7).timeout
	hide_textbox()

func conv4():
	add_text(ConvsKai[3], "Kai")
	await get_tree().create_timer(4).timeout
	add_text(ConvsAI[3], "AI")
	await get_tree().create_timer(6).timeout
	hide_textbox()

func conv5():
	add_text(ConvsKai[4], "Kai")
	await get_tree().create_timer(7).timeout
	add_text(ConvsAI[4], "AI")
	await get_tree().create_timer(8).timeout
	hide_textbox()

func conv6():
	add_text(ConvsKai[5], "Kai")
	await get_tree().create_timer(4.5).timeout
	add_text(ConvsAI[5], "AI")
	await get_tree().create_timer(8.5).timeout
	hide_textbox()
	
func conv7():
	add_text(ConvsKai[6], "Kai")
	await get_tree().create_timer(3.5).timeout
	add_text(ConvsAI[6], "AI")
	await get_tree().create_timer(9.5).timeout
	hide_textbox()
