extends Node2D

var prev_position = Vector2()
export (float) var hit_speed = 50
var speed
var vector_speed = Vector2()
export (float) var pat_time : float = 5
onready var pat_time_current : float = pat_time
var patting : bool = false
var doggo

func _process(delta):
	$Hand.global_position = get_global_mouse_position()
	vector_speed = $Hand.global_position - prev_position
	speed = vector_speed.length()
	prev_position = $Hand.global_position
	if speed != 0 :
		pat_time_current -= delta
		if pat_time_current <= 0 && !doggo.get_parent().patted:
			doggo.get_parent().pat()
			patting = false
			print('patted')
			pat_time_current = pat_time
			
	if $Doggo.patted && $Doggo2.patted && $Doggo3.patted :
		print('win')
	


func doggo_patted(area):
	if speed > hit_speed :
		area.get_parent().angy()
	else :
		patting = true
		$Hand/Sprite.frame = 1
		doggo = area
		doggo.get_parent().pet()
		


func doggo_unpatted(area):
	if patting:
		doggo.get_parent().angy()
	$Hand/Sprite.frame = 0
