extends CanvasLayer

@onready var pause_menu: VBoxContainer = $PauseMenu
@onready var how_to_play_panel: Panel = $"How To Play Panel"


# Reference to HowToPlay panel (Control node inside pause menu)
#@onready var how_to_play_panel: Control = $HowToPlayPanel

func _ready() -> void:
	visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS
	get_tree().paused = false

	# Hide How To Play panel initially
	if how_to_play_panel:
		how_to_play_panel.visible = false


# Toggle pause on ESC
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		# If HowToPlay panel is open, close it first
		if how_to_play_panel and how_to_play_panel.visible:
			how_to_play_panel.visible = false
		else:
			toggle_pause()


func toggle_pause() -> void:
	var tree := get_tree()
	tree.paused = !tree.paused
	visible = tree.paused


# -------------------
# BUTTON SIGNALS
# -------------------

# Resume button
func _on_resume_pressed() -> void:
	get_tree().paused = false
	visible = false

	# Unpause the game
	get_tree().paused = false
	visible = false

# How To Play button
func _on_how_to_play_pressed() -> void:
	
	pause_menu.visible = false
	how_to_play_panel.visible = true

# Main Menu button
func _on_main_menu_pressed() -> void:
	# Hide How To Play panel if open
	if how_to_play_panel:
		how_to_play_panel.visible = false

	# Reset GameState before leaving
	GameState.reset()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")

# Quit button
func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_back_pressed() -> void:
	pass # Replace with function body.
	pause_menu.visible = true
	how_to_play_panel.visible = false
