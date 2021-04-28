extends Node2D

var prev_position = Vector2()
export (float) var hit_speed = 50
var speed
var vector_speed = Vector2()
export (float) var pat_time : float = 5
var patting : bool = false
var patted : bool = false

func _process(delta):
	$Hand.global_position = get_global_mouse_position()
	vector_speed = $Hand.global_position - prev_position
	speed = vector_speed.length()
	prev_position = $Hand.global_position
	if speed != 0 :
		pat_time -= delta
		if pat_time <= 0 :
			patted = true
			patting = false
			print('patted')
	


func doggo_patted(area):
	if speed > hit_speed :
		print('Anger')
	else :
		patting = true
