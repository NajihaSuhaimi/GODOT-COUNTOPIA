extends Control

# ----------------- 
# JAWAPAN 
# 0 = A, 1 = B, 2 = C, 3 = D
# -----------------
@export var correct_answer := 1

@onready var button_a: Button = $ButtonA
@onready var button_b: Button = $ButtonB
@onready var button_c: Button = $ButtonC
@onready var button_d: Button = $ButtonD

@onready var correct_popup: Control = $CorrectPopUp
@onready var wrong_popup: Control = $WrongPopUp

func _ready() -> void:
	#SHOW QUIZ
	visible = false
	#CORRECT/WRONG INVISIBLE
	correct_popup.visible = false
	wrong_popup.visible = false
	enable_buttons()

# ----------------- 
# SIGNAL BUTTON
# -----------------

func _on_button_a_pressed() -> void:
	answer_selected(0)

func _on_button_b_pressed() -> void:
	answer_selected(1)

func _on_button_c_pressed() -> void:
	answer_selected(2)

func _on_button_d_pressed() -> void:
	answer_selected(3)

# ----------------- 
# LOGIC UNTUK CHECK JAWAPAN
# -----------------
func answer_selected(index: int) -> void:
	if index == correct_answer:
		show_correct()
	else:
		show_wrong()

# ----------------- 
# BETUL/SALAH
# -----------------
func show_correct() -> void:
	correct_popup.visible = true
	disable_buttons()

func show_wrong() -> void:
	wrong_popup.visible = true
	disable_buttons()  
	
# ----------------- 
# RETRY & CLOSE BTN 
# -----------------

#retry button nanti dia kasi jawab balik soalan tu
func _on_retrybtn_pressed() -> void:
	wrong_popup.visible = false
	enable_buttons()

# close button boleh guna untuk wrong popup and correct popup
func _on_tutpbtn_pressed() -> void:
	correct_popup.visible = false
	wrong_popup.visible = false
	visible = false

# ----------------- 
# UTILITIES 
# -----------------

func disable_buttons() -> void:
	button_a.disabled = true
	button_b.disabled = true
	button_c.disabled = true
	button_d.disabled = true

func enable_buttons() -> void:
	button_a.disabled = false
	button_b.disabled = false
	button_c.disabled = false
	button_d.disabled = false
