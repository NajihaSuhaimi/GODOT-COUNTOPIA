extends Area2D

@onready var flag_sprite: Sprite2D = (
	$FlagSprite if has_node("FlagSprite") else $Sprite2D
)

var is_active := false

func _ready() -> void:
	is_active = flag_sprite.texture != null
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.name != "Player1":
		return

	# ✅ FIX DI SINI
	# Jangan check GameManager.questions_completed
	# Sebab quiz update GameState.question_complete
	if GameState.question_complete < 7:
		print("❌ Flag locked:", GameState.question_complete, "/7")
		return

	# WIN
	if is_active:
		print("🏁 Player touched flag — WIN!")
		GameManager.win_game()
