extends Node2D
var rng = RandomNumberGenerator.new()
var points: int
var positions_taken
var newpos
var susfound
export(int) var max_points: int
func _ready():
	sus_time(0)
func sus_check(point_change):
	if point_change == -1:
		sus_time(point_change)
	elif point_change == 1:
		susfound += 1
		if susfound == 2:
			sus_time(point_change)
	
func sus_time(point_change):
	points += point_change
	positions_taken = [0, 1, 2, 3, 4, 5, 6, 7, 8]
	
	if points >= max_points:
		print("you win!")
	for i in get_child_count()-1:
		rng.randomize()
		newpos = rng.randi_range(0, positions_taken.size()-1)
		get_child(i).amogpos(positions_taken[newpos])
		get_child(i).visible = true
		positions_taken.remove(newpos)
	susfound = 0
	find_node("Timer").start()
	


func _on_Timer_timeout():
	sus_time(0)
