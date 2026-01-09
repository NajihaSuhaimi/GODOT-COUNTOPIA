extends CharacterBody2D

@export var speed := 300.0
@export var jump_force := -375.0
@export var gravity_multiplier := 1.75
@export var jump_hold_gravity := 0.6   # Smaller = jump higher
@export var coyote_time := 0.075
@export var spawn_position := Vector2(199, -64)

var coyote_timer := 0.0
var took_damage := false

@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer


# Normal respawn (delayed) for spikes / other damage
func respawn():
	# 🔒 SAFETY: do not respawn if node is leaving tree or player is dead
	if not is_inside_tree():
		return
	if GameState.player_health == 0:
		return

	took_damage = true

	velocity = Vector2.ZERO
	$CollisionShape2D.disabled = true
	visible = false

	# 🔒 SAFETY TIMER
	var tree := get_tree()
	if tree == null:
		return
	await tree.create_timer(0.5).timeout

	# 🔒 SAFETY AFTER AWAIT
	if not is_inside_tree():
		return

	global_position = spawn_position

	visible = true
	$CollisionShape2D.disabled = false

	var tree2 := get_tree()
	if tree2 == null:
		return
	await tree2.create_timer(0.3).timeout

	took_damage = false


# Instant respawn (no timers) for falling
func instant_respawn():
	# 🔒 SAFETY
	if not is_inside_tree():
		return
	if GameState.player_health == 0:
		return

	took_damage = true
	velocity = Vector2.ZERO
	global_position = spawn_position
	took_damage = false


func _physics_process(delta):
	if get_tree().paused:
		velocity = Vector2.ZERO
		move_and_slide()
		return 
	
	# Player falls into a hole → instant respawn
	if position.y > 400 and not took_damage:
		GameManager.update_player_health(-1)
		instant_respawn()
		return
		
	var gravity = get_gravity().y
	
	# Gravity handling
	if not is_on_floor():
		if Input.is_action_pressed("jump") and velocity.y < 0:
			velocity.y += gravity * jump_hold_gravity * delta
		else:
			velocity.y += gravity * gravity_multiplier * delta
		coyote_timer += delta
	else:
		coyote_timer = 0

	# Collisions with spikes
	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		if collision.get_collider().name == "TileMapspikes" and not took_damage:
			GameManager.update_player_health(-1)
			respawn()

	# Jump (once)
	if Input.is_action_just_pressed("jump") and (is_on_floor() or coyote_timer < coyote_time):
		velocity.y = jump_force

	# Horizontal movement
	var direction = Input.get_axis("move_left", "move_right")
	if direction != 0:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	if direction != 0:
		sprite_2d.flip_h = direction > 0

	handle_animation(direction)
	move_and_slide()


func handle_animation(direction: float) -> void:
	if abs(direction) > 0.1 and is_on_floor():
		animation_player.play("run")
	elif not is_on_floor():
		animation_player.play("jumping")
	else:
		animation_player.play("idle")


func _on_tutpbtn_pressed() -> void:
	pass
