extends Area2D
export(int) var sus_detect = 1
var rng = RandomNumberGenerator.new()
var amog_position

func randompos():
	rng.randomize()
	amog_position = Vector2(rng.randi_range(0, 750), rng.randi_range(0, 500))
	self.global_position = amog_position
func _ready():
	randompos()
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			get_parent().sus_time(sus_detect)
			#queue_free()
