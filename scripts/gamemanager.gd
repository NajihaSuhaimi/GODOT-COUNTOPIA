extends Node

# =========================
# FLAG ACTIVATE
# =========================
var questions_completed := 0
var required_questions := 7
var total_questions := 10

func can_activate_flag() -> bool:
	return questions_completed >= required_questions


# =========================
# HUD REFERENCES
# =========================
var heart: Label
var bluegem: Label
var greengem: Label
var yellowgem: Label
var redgem: Label
var purplegem: Label
var quest_complete: Label

var game_finished := false


# =========================
# READY
# =========================
func _ready() -> void:
	# detect scene change AUTOMATICALLY
	get_tree().scene_changed.connect(_on_scene_changed)


# =========================
# SCENE CHANGE HANDLER
# =========================
func _on_scene_changed():
	game_finished = false
	call_deferred("link_hud")


# =========================
# LINK HUD SAFELY
# =========================
func link_hud():
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


# =========================
# UPDATE HUD
# =========================
func update_all_hud():
	if heart:
		heart.text = str(GameState.player_health)
	if bluegem:
		bluegem.text = str(GameState.blue)
	if greengem:
		greengem.text = str(GameState.green)
	if yellowgem:
		yellowgem.text = str(GameState.yellow)
	if redgem:
		redgem.text = str(GameState.red)
	if purplegem:
		purplegem.text = str(GameState.purple)
	if quest_complete:
		quest_complete.text = str(GameState.question_complete)


# =========================
# HEALTH SYSTEM
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
# WIN GAME
# =========================
func win_game():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scene/win_screen.tscn")


# =========================
# SCORE SYSTEM
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

func add_score_yellow():
	GameState.yellow += 1
	update_all_hud()

func add_score_purple():
	GameState.purple += 1
	update_all_hud()


# =========================
# QUESTION COMPLETE
# =========================
func add_question_complete():
	questions_completed += 1
	GameState.question_complete += 1
	update_all_hud()


func _on_button_a_pressed() -> void:
	pass # Replace with function body.
