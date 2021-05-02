extends Node2D
var song = [1,4,1,2,3]
var arrows = load("res://Scenes/DDR/Arrows.tscn")
var song_play = 0
var points = 0
func _ready():
	pass # Replace with function body.



#func _process(delta):
	#if points < -3:
		#print("you lose!")



func _on_Timer_timeout():
	if song_play >= song.size():
		find_node("Timer").stop()
	else:
		if song[song_play] != 0:
			var new_arrow = arrows.instance()
			add_child(new_arrow)
			get_child(get_child_count()-1).arrow_config(song[song_play])
			get_child(get_child_count()-1).arrow_active()
			if song_play > 0:
					get_child(get_child_count()-2).arrow_active()
		song_play += 1




