extends Control

func _ready():
	$AnimationPlayer.play("RESET")

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")

func testEsc():
	if Input.is_action_just_pressed("backspace") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("backspace") and get_tree().paused:
		resume()

func _process(delta):
	testEsc()

func _on_resume_pressed():
	resume()
	
func _on_retry_pressed() -> void:
	resume()
	get_tree().reload_current_scene()

func _on_how_to_play_pressed() -> void:
	pass # Replace with function body.

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_quit_pressed():
	get_tree().quit()
