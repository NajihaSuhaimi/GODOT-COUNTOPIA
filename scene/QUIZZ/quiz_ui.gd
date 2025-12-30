extends Control

# --- Question Data ---
var questions = [
	{
		"question": "5 + 3 = ?", 
		"options": ["6", "7", "8", "9"], 
		"answer": 2  # index jawapan betul (0-based)
	},
	{
		"question": "2 * 4 = ?", 
		"options": ["6", "7", "8", "9"], 
		"answer": 2
	},
	{
		"question": "10 - 7 = ?", 
		"options": ["2", "3", "4", "5"], 
		"answer": 1
	}
]

var current_question_index = 0

# --- Called when scene starts ---
func _ready():
	load_question(current_question_index)

# --- Load Question into UI ---
func load_question(index):
	current_question_index = index
	var q = questions[index]
	
	# Update question label
	$Panel/QuestionLabel.text = q["question"]
	
	# Update buttons text
	for i in range(4):
		var btn = $Panel/VBoxContainer.get_child(i)
		btn.text = q["options"][i]
		btn.disabled = false  # enable button for new question
	
	# Clear feedback
	$Panel/FeedbackLabel.text = ""

# --- Handle Button Press ---
func _on_Option_pressed(option_index):
	var correct_index = questions[current_question_index]["answer"]
	
	if option_index == correct_index:
		$Panel/FeedbackLabel.text = "✅ Betul!"
	else:
		$Panel/FeedbackLabel.text = "❌ Salah!"
	
	# Disable all buttons
	for btn in $Panel/VBoxContainer.get_children():
		btn.disabled = true

# --- Optional: Next Question ---
func next_question():
	var next_index = current_question_index + 1
	if next_index < questions.size():
		load_question(next_index)
	else:
		$Panel/FeedbackLabel.text = "🎉 Semua soalan selesai!"
