extends CharacterBody2D

@export var speed := 300.0
@export var jump_force := -375.0
@export var gravity_multiplier := 1.75
@export var jump_hold_gravity := 0.6   # lebih kecil = lompat tinggi
@export var coyote_time := 0.075

var coyote_timer := 0.0

@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer

func _physics_process(delta):
	var gravity = get_gravity().y

	# Gravity handling
	if not is_on_floor():
		if Input.is_action_pressed("jump") and velocity.y < 0:
			# tahan jump → gravity lemah
			velocity.y += gravity * jump_hold_gravity * delta
		else:
			# normal / jatuh cepat
			velocity.y += gravity * gravity_multiplier * delta
		coyote_timer += delta
	else:
		coyote_timer = 0

	# Jump (sekali sahaja)
	if Input.is_action_just_pressed("jump") and (is_on_floor() or coyote_timer < coyote_time):
		velocity.y = jump_force

	# Horizontal movement
	var direction = Input.get_axis("move_left", "move_right")
	if direction != 0:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
	#flip sprite arah dia bergerak
	if direction != 0:
		sprite_2d.flip_h = direction > 0
		
	handle_animation(direction)
	
	move_and_slide()

func handle_animation(direction : float) -> void:
	if abs(direction) > 0.1 and is_on_floor():
		animation_player.play("run")
	elif not is_on_floor():
		animation_player.play("jumping")
	else:
		animation_player.play("idle")
	
