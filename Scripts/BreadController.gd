extends Node2D

var held_object = null

func _ready():
	#for node in get_tree().get_nodes_in_group("pickable"):
	#	node.connect("clicked", self, "_on_pickable_clicked")
	get_node("Bread/Slice").connect("clicked", self, "_on_pickable_clicked")
	get_node("Bread/Slice2").connect("clicked", self, "_on_pickable_clicked")
	get_node("Bread/Slice3").connect("clicked", self, "_on_pickable_clicked")

func _on_pickable_clicked(object):
	if !held_object:
		held_object = object
		held_object.pickup()

func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if held_object and !event.pressed:
			held_object.drop(Input.get_last_mouse_speed() / 2)
			held_object = null
