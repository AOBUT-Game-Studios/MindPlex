extends Node2D

var dead : bool = false
var points : int = 0
var target = preload("res://Scenes/Ducko/Target.tscn")
var bread = preload("res://Scenes/Ducko/Bread.tscn")
var targetInstance
export (float) var targetFrequency = 0.5
var targetTimer

func _ready():
	targetInstance = target.instance()
	targetTimer = targetFrequency

func _process(delta):
	targetTimer -= delta
	if points == 33 :
		print('win')
	if targetTimer <= 0:
		targetInstance = target.instance()
		add_child(targetInstance)
		targetTimer = targetFrequency
	if dead:
		$Duck.dead()
		
func bread():
	points += 1
	var breadInstance = bread.instance()
	add_child(breadInstance)
		
