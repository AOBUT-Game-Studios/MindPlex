extends Area2D
export(int) var sus_detect = -1
#var rng = RandomNumberGenerator.new()
var amog_position
var amog_slot

func amogpos(slot):
	if slot == 0:
		self.global_position = Vector2(200, 100)
	elif slot == 1:
		self.global_position = Vector2(500, 100)
	elif slot == 2:
		self.global_position = Vector2(800, 100)
	elif slot == 3:
		self.global_position = Vector2(200, 250)
	elif slot == 4:
		self.global_position = Vector2(500, 250)
	elif slot == 5:
		self.global_position = Vector2(800, 250)
	elif slot == 6:
		self.global_position = Vector2(200, 400)
	elif slot == 7:
		self.global_position = Vector2(500, 400)
	elif slot == 8:
		self.global_position = Vector2(800, 400)

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			self.visible = false
			get_parent().sus_check(sus_detect)
