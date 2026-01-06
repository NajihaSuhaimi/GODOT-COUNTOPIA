extends CharacterBody2D

@export var speed := 300.0
@export var jump_force := -375.0
@export var gravity_multiplier := 1.75
@export var jump_hold_gravity := 0.6   # lebih kecil = lompat tinggi
@export var coyote_time := 0.075

var coyote_timer := 0.0
var took_damage = false

@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer
@onready var game_manager: Node = $"../GameManager"

func respawn():
	took_damage = true
	
	# Matikan pergerakan & collision
	velocity = Vector2.ZERO
	$CollisionShape2D.disabled = true
	visible = false
	
	await get_tree().create_timer(0.5).timeout
	
	# Pindah ke spawn point
	global_position = Vector2(199, -64)
	
	visible = true
	$CollisionShape2D.disabled = false
	
	await get_tree().create_timer(0.3).timeout
	took_damage = false


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
		
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		
		if collision.get_collider().name == "TileMapspikes": #if player touches anything drawn in tilemapspikes
			if took_damage == false:
				game_manager.update_player_health(-1)
				respawn() #respawn the player

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
	


func _on_tutpbtn_pressed() -> void:
	pass # Replace with function body.
