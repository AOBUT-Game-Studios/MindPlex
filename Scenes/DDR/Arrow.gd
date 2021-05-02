extends Area2D

var directions = ["North", "East", "South", "West"]
var new_direction
var move = Vector2(0, 0)
export var speed = 2
var active = true
func arrow_config(direction):
	if direction == 1:
		position.x = 50
		rotation_degrees = 0
		new_direction = 0
	elif direction == 2:
		position.x = 150
		rotation_degrees = 90
		new_direction = 1
	elif direction == 3:
		position.x = 250
		rotation_degrees = 180
		new_direction = 2
	elif direction == 4:
		position.x = 350
		rotation_degrees = 270
		new_direction = 3
	move = Vector2(0, 1)


func _process(delta):
	if new_direction != null:
		_get_input()
	self.position += move*speed
	if position.y > 600:
		self.queue_free()


func arrow_active():
	if active:
		active = false
	else:
		active = true


func _get_input():
	if Input.is_action_pressed(directions[new_direction]):
		if position.y > 500 and position.y < 550:
			print("wow")
			get_parent().points +=2
			print (get_parent().points)
			self.queue_free()



