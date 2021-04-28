extends Node2D

var points: int

export(int) var max_points: int

func sus_time(point_change):
	points += point_change
	if points >= max_points:
		print("you win!")
	for i in get_child_count():
		get_child(i).randompos()
		
	
