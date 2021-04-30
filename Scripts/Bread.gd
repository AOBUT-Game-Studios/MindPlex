extends Area2D

var rng = RandomNumberGenerator.new()

func _ready():
	$AnimationPlayer.play("Fly")
	rng.randomize()
	global_position = Vector2(rng.randf_range(100, 924), rng.randf_range(50, 550))


func _on_Bread_body_entered(body):
	if body.name == "Duck":
		get_parent().bread()
		queue_free()
