extends CharacterBody2D

@export var speed = 300 # How fast the player will move (pixels/sec).
@onready var anim = $CatAnimationPlayer

func _physics_process(delta):
	move_player()


func move_player():
	velocity = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down")).normalized() * speed
	if velocity.x == 0 && velocity.y == 0:
		anim.play("idle")

	move_and_slide()

