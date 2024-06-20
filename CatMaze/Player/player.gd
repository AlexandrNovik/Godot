extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var anim = $AnimatedSprite2D

func _physics_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")

	_handleMove(direction)
	_handleJump(delta)
	_setVelocity(direction)

	move_and_slide()


func _handleMove(direction):
	_setMoveAnimation(direction)
	_setFlip(direction)


func _handleJump(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("jump")

func _setVelocity(direction):
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


func _setMoveAnimation(direction):
	if velocity.y == 0:
		if direction > 0 || direction < 0:
			anim.play("run")
		else:
			anim.play("idle")
	elif velocity.y > 0:
		anim.play("fall")


func _setFlip(direction):
	if direction == -1:
		anim.flip_h = true
	elif direction == 1:
		anim.flip_h = false

