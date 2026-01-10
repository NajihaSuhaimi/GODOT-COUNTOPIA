extends Area2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var picked_up = false

func _on_body_entered(body: Node2D) -> void:
	
	if body.name == "Player1" and picked_up == false:
	
		picked_up = true
		GameManager.add_score_yellow()
		animated_sprite_2d.visible = false
		audio_stream_player_2d.play()
		await audio_stream_player_2d.finished
		queue_free()
