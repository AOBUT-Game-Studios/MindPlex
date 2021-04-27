extends KinematicBody2D

var velocity = Vector2()
export (float) var speed : float = 100

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("North"):
		velocity.y += -1
	if Input.is_action_pressed("South"):
		velocity.y += 1
	if Input.is_action_pressed("East"):
		velocity.x += 1
	if Input.is_action_pressed("West"):
		velocity.x += -1
		
	velocity = velocity.normalized() * speed
	
func _physics_process(delta):
	get_input()
	move_and_slide(velocity)
