extends Area2D

@onready var quiz = $"../Questions/QuizTambah1"

func _on_body_entered(body):
	print("MASUK AREA:", body)
		# Kalau bukan Player, ignore
	if body.name != "Player1":
		return

	# Kalau quiz dah siap, ignore
	if quiz.completed:
		return

	# Baru buka quiz
	quiz.open_quiz()
