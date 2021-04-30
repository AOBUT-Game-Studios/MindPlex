extends RigidBody2D

signal clicked
var held : bool = false
var originpos
var force = Vector2()


func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			emit_signal("clicked", self)
			
func _integrate_forces(state):
	if held:
		add_central_force(get_local_mouse_position()/5)
		#add_torque(get_local_mouse_position().x)
		#add_torque(get_local_mouse_position().y)
	else:
		add_central_force(-applied_force/50)
	
	
func pickup():
	if held:
		return
	#mode = RigidBody2D.MODE_STATIC
	held = true
	#originpos = global_transform.origin
	#global_transform.origin = get_global_mouse_position()
	#get_node("CollisionShape2D").global_transform.origin  = originpos
	
func drop(impulse=Vector2.ZERO):
	if held:
		#mode = RigidBody2D.MODE_RIGID
		#apply_central_impulse(impulse)
		held = false
		#global_transform.origin = get_node("CollisionShape2D").transform.origin
		#get_node("CollisionShape2D").position = Vector2()

		
	
