extends Node

var heart: Label
var bluegem: Label
var greengem: Label
var yellowgem: Label
var redgem: Label
var purplegem: Label
var quest_complete: Label

var game_finished := false  # prevents multiple scene changes

func _ready() -> void:
	await get_tree().process_frame
	link_hud()

func link_hud() -> void:
	var root = get_tree().current_scene
	if root == null:
		return

	heart = root.get_node_or_null("Diamonds/Control/HBoxContainer/VBoxContainer/heart/Label")
	bluegem = root.get_node_or_null("Diamonds/Control/HBoxContainer/VBoxContainer/bluegem/Label")
	greengem = root.get_node_or_null("Diamonds/Control/HBoxContainer/VBoxContainer/greengem/Label")
	yellowgem = root.get_node_or_null("Diamonds/Control/HBoxContainer/VBoxContainer/yellowgem/Label")
	redgem = root.get_node_or_null("Diamonds/Control/HBoxContainer/VBoxContainer/redgem/Label")
	purplegem = root.get_node_or_null("Diamonds/Control/HBoxContainer/VBoxContainer/purplegem/Label")
	quest_complete = root.get_node_or_null("Diamonds/Control/HBoxContainer/VBoxContainer2/quest_complete/Label")

	update_all_hud()

func update_all_hud():
	if heart:
		heart.text = str(GameState.player_health)
	if bluegem:
		bluegem.text = str(GameState.blue)
	if greengem:
		greengem.text = str(GameState.green)
	if redgem:
		redgem.text = str(GameState.red)
	if yellowgem:
		yellowgem.text = str(GameState.yellow)
	if purplegem:
		purplegem.text = str(GameState.purple)
	if quest_complete:
		quest_complete.text = str(GameState.question_complete)

# =========================
# HEALTH → GAME OVER
# =========================
func update_player_health(amount: int):
	GameState.player_health += amount

	if GameState.player_health < 0:
		GameState.player_health = 0

	update_all_hud()

	if GameState.player_health == 0 and not game_finished:
		game_finished = true
		game_over()

func game_over():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scene/game_over.tscn")

# =========================
# WIN CONDITION (RED GEM)
# =========================
func win_game():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scene/win_screen.tscn")

# =========================
# SCORE FUNCTIONS
# =========================
func add_score_blue():
	GameState.blue += 1
	update_all_hud()

func add_score_green():
	GameState.green += 1
	update_all_hud()

func add_score_red():
	GameState.red += 1
	update_all_hud()

#	# 🏆 WIN IMMEDIATELY when red diamond is collected
#	get_tree().paused = false
#	get_tree().change_scene_to_file("res://scene/win_screen.tscn")

func add_score_yellow():
	GameState.yellow += 1
	update_all_hud()

func add_score_purple():
	GameState.purple += 1
	update_all_hud()

func add_question_complete():
	GameState.question_complete += 1
	update_all_hud()
