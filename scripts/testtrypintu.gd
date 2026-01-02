extends Area2D

@onready var quiz = $"../CanvasLayer/QuizTambah1"

func _on_body_entered(body):
	print("MASUK AREA:", body)
	if body.name == "Player1":
		quiz.open_quiz()
