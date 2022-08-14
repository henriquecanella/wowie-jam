class_name Cleber
extends KinematicBody2D

export var speed: int = 60
var is_player_target: bool = false
var player: Object

var game_controller = GameController.new()
var target: Vector2
var velocity: = Vector2()

var find_timer: Timer = Timer.new()
var search_timeout = 6

var current_status = {
	state = states.default,
	range = 1,
	can_use_habitlity = 3
}

enum states {
	default,
	open,
	on,
	grab,
	find
}

## MOVE CLEBER ##
func move(_delta):
	if Singleton.can_act:
	# velocity = position.direction_to(target) * speed
		look_at(target)

		if (rotation_degrees < 270 && rotation_degrees > 90) || (rotation_degrees < -90 && rotation_degrees > -270):
			scale = Vector2(1, -1)
		else:
			scale = Vector2(1, 1)
		
		var horizontal_spacing: int = 2
		var vertical_spacing: int = 2
		
		if target.x > position.x:
			horizontal_spacing = -horizontal_spacing
			
		if target.y > position.y:
			vertical_spacing = -vertical_spacing
			
		if position.distance_to(target) > 15:
			position += ((target - (position - Vector2(horizontal_spacing, vertical_spacing)))/50)
			velocity = move_and_slide(velocity)
		elif !is_player_target:
			follow_player()

## HELPERS ##
func stop():
	target = position

func follow_player():
	target = player.position
	is_player_target = true
	# if timer:
	find_timer.stop()

func follow_clicked_target():
	find_timer.stop()
	target = get_global_mouse_position()

	find_timer.set_one_shot(true)
	find_timer.set_wait_time(search_timeout);
	find_timer.connect("timeout", self, "on_timeout_complete")
	add_child(find_timer)

	is_player_target = false

func change_mode(input):
	if input == current_status.state:
		current_status.state = states.default
		return

	if input == states.open:
		current_status.state = states.open
		return

	if input == states.on:
		current_status.state = states.on
		return

	if input == states.grab:
		current_status.state = states.grab
		return

	if input == states.find:
		current_status.state = states.find
		return

func handle_click_target():
	follow_clicked_target()

func on_timeout_complete():
	if position.distance_to(target) > 15:
		follow_player()

## CLEBER'S ACTIONS ##
func open_close ():
	if current_status.can_use_habitlity && current_status.state == states.open:
		pass
	pass
		
func on_off ():
	if current_status.can_use_habitlity && current_status.state == states.on:
		pass
	pass

func grab_drop ():
	if current_status.can_use_habitlity && current_status.state == states.grab:
		pass
	pass

func find_path ():
	if current_status.can_use_habitlity && current_status.state == states.find:
		pass
	pass


## DEFAULT FUNCTIONS ##
func _ready():
	player = get_parent().get_node("Player")
	target = player.position

func _process(_delta):
	if is_player_target:
		target = player.position

func _input(event):
	change_mode(game_controller.get_robot_hability_input())

	if event.is_action_pressed("mouse_1"):
		handle_click_target()
		find_timer.start()
	

func _physics_process(delta):
	move(delta)
