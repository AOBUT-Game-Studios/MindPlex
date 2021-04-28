extends RigidBody2D

signal clicked
var held : bool = false
var originpos


func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			emit_signal("clicked", self)
			
func _physics_process(delta):
	if held:
		global_transform.origin = get_global_mouse_position()
		
func pickup():
	if held:
		return
	#mode = RigidBody2D.MODE_STATIC
	held = true
	originpos = global_transform.origin
	global_transform.origin = get_global_mouse_position()
	get_node("CollisionShape2D").global_transform.origin  = originpos
	
func drop(impulse=Vector2.ZERO):
	if held:
		#mode = RigidBody2D.MODE_RIGID
		#apply_central_impulse(impulse)
		held = false
		global_transform.origin = get_node("CollisionShape2D").global_transform.origin
		get_node("CollisionShape2D").global_transform.origin = global_transform.origin
