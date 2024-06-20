extends CharacterBody2D

@export var speed = 300 # How fast the player will move (pixels/sec).


func _physics_process(delta):
	move_player()


func move_player():
	velocity = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down")).normalized() * speed
	move_and_slide()

