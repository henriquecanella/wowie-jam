class_name GameController


func get_movement_input() -> Vector2:
	var input = Vector2()

	if Input.is_action_pressed('ui_right'):
		input.x +=1
	if Input.is_action_pressed('ui_left'):
		input.x -= 1
	if Input.is_action_pressed('ui_down'):
		input.y += 1
	if Input.is_action_pressed('ui_up'):
		input.y -= 1
	
	return input
