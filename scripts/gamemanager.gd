extends Node
#
var took_damage = false




#@onready var score: Control = $"../CanvasLayer/Control/VBoxContainer/score/Label"
#
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#
	#print(GameState.player_health)
#
#
#func update_player_health(amount: int):
	#GameState.player_health += amount
	#heart.text = str(Game)
#
#func add_score():
	#GameState.score += 1
	#score.text = str(GameState.score)
	
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
	
	
	

	
