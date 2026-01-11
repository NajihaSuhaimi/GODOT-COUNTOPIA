extends Control

@onready var bunyiwin: AudioStreamPlayer2D = $bunyiwin
@onready var button_biasa: AudioStreamPlayer2D = $"button biasa"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bunyiwin.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_main_menu_pressed() -> void:
	button_biasa.play()
	await button_biasa.finished
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")


func _on_quit_pressed() -> void:
	button_biasa.play()
	await button_biasa.finished
	get_tree().quit()
