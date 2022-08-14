class_name GameController

enum states {
	default,
	open,
	on,
	grab,
	find
}

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

func get_robot_hability_input() -> int:
	if Input.is_action_pressed("hability_1"):
		return states.open

	if Input.is_action_pressed("hability_2"):
		return states.on

	if Input.is_action_pressed("hability_3"):
		return states.grab

	if Input.is_action_pressed("hability_4"):
		return states.find

	return -1
