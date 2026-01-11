extends Area2D

@onready var quiz = $"../Questions/QuizDarab2"

@export var required_color: String = "blue"
@export var required_amount: int = 7

func _on_body_entered(body):
	print("MASUK AREA:", body)

	# Ignore if not player
	if body.name != "Player1":
		return

	# Ignore if quiz already completed
	if quiz.completed:
		print("Quiz already completed")
		return

	# Check diamond requirement
	if not has_required_gems():
		print("Not enough ", required_color, " diamonds")
		return

	# Consume diamonds & open quiz
	consume_gems()
	quiz.open_quiz()


func has_required_gems() -> bool:
	match required_color:
		"blue":
			return GameState.blue >= required_amount
		"green":
			return GameState.green >= required_amount
		"red":
			return GameState.red >= required_amount
		"yellow":
			return GameState.yellow >= required_amount
		"purple":
			return GameState.purple >= required_amount
		_:
			return false


func consume_gems():
	match required_color:
		"blue":
			GameState.blue -= required_amount
		"green":
			GameState.green -= required_amount
		"red":
			GameState.red -= required_amount
		"yellow":
			GameState.yellow -= required_amount
		"purple":
			GameState.purple -= required_amount
