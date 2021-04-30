extends Area2D

export (float) var lifetime = 3.2
var lethal = false

func _ready():
	$AnimationPlayer.play("Flash")
	
func _process(delta):
	lifetime -= delta
	if lifetime < 0.2 :
		$AnimationPlayer.play("Shoot")
	if lifetime < 0 :
		if lethal:
			get_parent().dead = true
		queue_free()


func _on_Target_body_entered(body):
	if body.name == "Duck":
		lethal = true

func _on_Target_body_exited(body):
	if lethal:
		lethal = false
