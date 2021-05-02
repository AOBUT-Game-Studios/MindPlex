extends Area2D
func _process(delta):
	if Input.is_action_just_pressed("North") or Input.is_action_just_pressed("South") or Input.is_action_just_pressed("East") or Input.is_action_just_pressed("West"):
		get_parent().points -= 1

