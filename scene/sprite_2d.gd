extends Area2D

@onready var sprite := $Sprite2D

var is_active := false

func _ready():
	# 🔍 Detect if this flag has a red flag sprite
	if sprite.texture != null:
		is_active = true
	else:
		is_active = false


func _on_body_entered(body):
	if body.name != "Player1":
		return

	if is_active:
		GameManager.win_game()
	else:
		print("Flag is inactive (pole only)")
