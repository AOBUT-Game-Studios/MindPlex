extends Node2D

var patted = false
var angy = false

func pat():
	if !angy:
		patted = true
		$AnimationPlayer.play("Happ")

func pet():
	if !angy:
		$Sprite.frame = 4
	
func angy():
	$Sprite.frame = 3
	angy = true

