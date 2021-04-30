extends Area2D

func _ready():
	$AnimationPlayer.play("Fly")


func _on_Bread_body_entered(body):
	if body.name == "Duck":
		get_parent().points += 1
		queue_free()
