extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var animation = $AnimatedSprite2D
var health = 10
var score = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animation.play("Jump")


	var direction = 0
	if Input.is_key_pressed(KEY_A) :
		direction = -1
	elif Input.is_key_pressed(KEY_D) : 
		direction = 1
	else :
		direction = 0


	if direction:
		velocity.x = direction * SPEED
		if velocity.y == 0:
			animation.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0:
			animation.play("Idle")

	if direction == -1:
		$AnimatedSprite2D.flip_h = true
	elif direction == 1: 
		$AnimatedSprite2D.flip_h = false
		
	if velocity.y > 0:
		animation.play("Fall")

	if health <= 0:
		queue_free()
		get_tree().change_scene_to_file("res://death.tscn")


	move_and_slide()
