extends Area2D

# The flag sprite
@onready var flag_sprite: Sprite2D = $FlagSprite if has_node("FlagSprite") else $Sprite2D

# Is the flag active? (true if it has a texture)
var is_active := false

func _ready() -> void:
	# The flag is active if it has a texture
	is_active = flag_sprite.texture != null
	# Connect the body_entered signal
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.name != "Player1":
		return

	if is_active:
		print("Player touched the flag! Win triggered!")
		GameManager.win_game()  # Call the win screen
	else:
		print("Flag inactive")
