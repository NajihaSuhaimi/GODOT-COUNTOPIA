extends Control

@onready var main_buttons: VBoxContainer = $"Main Buttons"
@onready var how_to_play_panel: Panel = $"How To Play Panel"
@onready var level_selection_panel: Panel = $"Level Selection Panel"

# Main Menu
func _ready() -> void:
	pass # Replace with function body.
	main_buttons.visible = true
	how_to_play_panel.visible = false
	level_selection_panel.visible = false

func _process(delta: float) -> void:
	pass

func _on_starGame_pressed() -> void:
	main_buttons.visible = false
	level_selection_panel.visible = true

func _on_howToPlay_pressed() -> void:
	main_buttons.visible = false
	how_to_play_panel.visible = true

func _on_quit_pressed() -> void:
	get_tree().quit()

# How to Play
func _on_back_how_to_play_pressed() -> void:
	_ready()

# Select Level
func _on_additionLevel_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/Addition baru.tscn")

func _on_subtractionLevel_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/substraction level.tscn")

func _on_multiplicationLevel_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/multiplication level.tscn")

func _on_divisionLevel_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/division level.tscn")

func _on_backLevelSelect_pressed() -> void:
	_ready()
