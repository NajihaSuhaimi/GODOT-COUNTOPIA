extends Control

@onready var main_buttons: VBoxContainer = $"Main Buttons"
@onready var how_to_play_panel: Panel = $"How To Play Panel"
@onready var level_selection_panel: Panel = $"Level Selection Panel"
@onready var button_biasa: AudioStreamPlayer2D = $button_biasa

# Main Menu
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	pass # Replace with function body.
	main_buttons.visible = true
	how_to_play_panel.visible = false
	level_selection_panel.visible = false

func _process(delta: float) -> void:
	pass


func _on_quit_pressed() -> void:
	button_biasa.play()
	await button_biasa.finished
	get_tree().quit()

# How to Play
func _on_back_how_to_play_pressed() -> void:
	_ready()

# Select Leve
func _on_addition_pressed() -> void:
	button_biasa.play()
	await button_biasa.finished
	get_tree().change_scene_to_file("res://scene/Addition baru.tscn")

func _on_subtraction_pressed() -> void:
	pass # Replace with function body.
	button_biasa.play()
	await button_biasa.finished
	get_tree().change_scene_to_file("res://scene/substraction level.tscn")

func _on_multiplication_pressed() -> void:
	pass # Replace with function body.
	button_biasa.play()
	await button_biasa.finished
	get_tree().change_scene_to_file("res://scene/multiplication level.tscn")

func _on_division_pressed() -> void:
	button_biasa.play()
	await button_biasa.finished
	get_tree().change_scene_to_file("res://scene/division level.tscn")
	
func _on_backLevelSelect_pressed() -> void:
	button_biasa.play()
	await button_biasa.finished
	_ready()


func _on_how_to_play_pressed() -> void:
	pass # Replace with function body.
	main_buttons.visible = false
	button_biasa.play()
	await button_biasa.finished
	how_to_play_panel.visible = true

func _on_start_game_pressed() -> void:
	pass # Replace with function body.
	main_buttons.visible = false
	button_biasa.play()
	await button_biasa.finished
	level_selection_panel.visible = true


func _on_back_pressed() -> void:
	pass # Replace with function body.
	main_buttons.visible = true
	level_selection_panel.visible = false
	button_biasa.play()
	await button_biasa.finished
	how_to_play_panel.visible = false
