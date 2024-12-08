extends CharacterBody2D

@onready var anim = $AnimationPlayer

func _physics_process(delta):
	anim.play("idle")


func _on_detector_body_entered(body):
	if body.name == "Cat":
		queue_free()
