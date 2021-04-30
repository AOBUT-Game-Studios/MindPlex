extends KinematicBody2D

export (float) var h_speed : float = 100
export (float) var fall_speed : float = 10
export (float) var jump_height : float = 20
var gravity = 0
var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("West"):
		velocity.x += -1 * h_speed
		$Sprite.flip_h = true
	if Input.is_action_pressed("East"):
		velocity.x += 1 * h_speed
		$Sprite.flip_h = false
	if Input.is_action_just_pressed("Spacebar"):
		gravity = jump_height
		$AnimationPlayer.play("Flap")
	gravity -= fall_speed
	velocity.y -= gravity

		
func _physics_process(delta):
	get_input()
	move_and_slide(velocity)
