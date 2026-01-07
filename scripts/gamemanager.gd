extends Node

var heart
var bluegem
var greengem
var yellowgem
var redgem
var purplegem
var quest_complete


func _ready() -> void:
	await get_tree().process_frame
	link_hud()


func link_hud() -> void:
	var root = get_tree().current_scene
	if root == null:
		return

	heart = root.get_node("Diamonds/Control/HBoxContainer/VBoxContainer/heart/Label")
	bluegem = root.get_node("Diamonds/Control/HBoxContainer/VBoxContainer/bluegem/Label")
	greengem = root.get_node("Diamonds/Control/HBoxContainer/VBoxContainer/greengem/Label")
	yellowgem = root.get_node("Diamonds/Control/HBoxContainer/VBoxContainer/yellowgem/Label")
	redgem = root.get_node("Diamonds/Control/HBoxContainer/VBoxContainer/redgem/Label")
	purplegem = root.get_node("Diamonds/Control/HBoxContainer/VBoxContainer/purplegem/Label")
	quest_complete = root.get_node("Diamonds/Control/HBoxContainer/VBoxContainer2/quest_complete/Label")

	# sync HUD
	heart.text = str(GameState.player_health)
	bluegem.text = str(GameState.blue)
	greengem.text = str(GameState.green)
	redgem.text = str(GameState.red)
	yellowgem.text = str(GameState.yellow)
	purplegem.text = str(GameState.purple)
	quest_complete.text = str(GameState.question_complete)


func update_player_health(amount: int):
	GameState.player_health += amount
	heart.text = str(GameState.player_health)


func add_score_blue():
	GameState.blue += 1
	bluegem.text = str(GameState.blue)


func add_score_green():
	GameState.green += 1
	greengem.text = str(GameState.green)


func add_score_red():
	GameState.red += 1
	redgem.text = str(GameState.red)


func add_score_yellow():
	GameState.yellow += 1
	yellowgem.text = str(GameState.yellow)


func add_score_purple():
	GameState.purple += 1
	purplegem.text = str(GameState.purple)


func add_question_complete():
	GameState.question_complete += 1
	quest_complete.text = str(GameState.question_complete)


func game_over():
	get_tree().change_scene_to_file("res://scene/game_over.tscn")
