extends Node
#
var took_damage = false

@onready var heart: Control = $"../Diamonds/Control/HBoxContainer/VBoxContainer/heart/Label"
@onready var bluegem: Control = $"../Diamonds/Control/HBoxContainer/VBoxContainer/bluegem/Label"
@onready var greengem: Control = $"../Diamonds/Control/HBoxContainer/VBoxContainer/greengem/Label"
@onready var yellowgem: Control = $"../Diamonds/Control/HBoxContainer/VBoxContainer/yellowgem/Label"
@onready var redgem: Control = $"../Diamonds/Control/HBoxContainer/VBoxContainer/redgem/Label"
@onready var purplegem: Control = $"../Diamonds/Control/HBoxContainer/VBoxContainer/purplegem/Label"
@onready var quest_complete: Control = $"../Diamonds/Control/HBoxContainer/VBoxContainer2/quest_complete/Label"

## Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	heart.text = str(GameState.player_health)

#called untuk update question yang dah complete
func add_question_complete():
	GameState.question_complete += 1
	quest_complete.text = str(GameState.question_complete)
	print("✅ QUESTION COMPLETE:", GameState.question_complete)

func update_player_health(amount: int):
	GameState.player_health += amount
	heart.text = str(GameState.player_health)
	

func _process(delta: float) -> void:
	
	if GameState.player_health == 0:
		print("Game over")

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
	
		
func game_over():
	get_tree().change_scene_to_file("res://scene/game_over.tscn")
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	
	
# Game Over Scene
#	if GameState.player_health == 0:
#		print("Game Over")


func _on_tutpbtn_pressed() -> void:
	pass # Replace with function body.


func _on_retrybtn_pressed() -> void:
	pass # Replace with function body.


func _on_button_c_pressed() -> void:
	pass # Replace with function body.
	
