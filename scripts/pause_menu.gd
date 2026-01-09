extends Control

@onready var anim: AnimationPlayer = $AnimationPlayer

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		if get_tree().paused:
			resume()
		else:
			pause()

func pause():
	visible = true
	get_tree().paused = true
	anim.play("blur")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func resume():
	anim.play_backwards("blur")
	await anim.animation_finished
	get_tree().paused = false
	visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

# ======================
# BUTTON SIGNALS
# ======================

func _on_resume_pressed():
	resume()

func _on_retry_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scene/mainmenuu.tscn")

func _on_quit_pressed():
	get_tree().quit()
