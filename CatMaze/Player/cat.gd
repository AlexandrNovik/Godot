extends CharacterBody2D

@export var speed = 120 # How fast the player will move (pixels/sec).
@onready var anim = $CatAnimationPlayer
var eating = false


func _physics_process(_delta):
	move_player()


func move_player():
	velocity = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down")).normalized() * speed
	move_and_slide()
	if !eating:
		playMoveAnimation()


var stopFlag = false
func playMoveAnimation():
	if velocity.length() > 0.0:
		stopFlag = false
		anim.play("move")
	else:
		if !stopFlag:
			anim.stop()
			stopFlag = true
		anim.play("idle")


func _on_area_2d_body_entered(body):
	if body.name == "Mouse":
		eating = true
		anim.stop()
		anim.play("eat")
		await anim.animation_finished
		eating = false
