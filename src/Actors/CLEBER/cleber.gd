class_name Cleber
extends KinematicBody2D

export var speed: int = 60
var is_player_target: bool = false
var player: Object

var target: Vector2
var velocity: = Vector2()

func _ready():
	player = get_parent().get_node("Player")
	target = player.position

func _process(_delta):
	if is_player_target:
		target = player.position

func _input(event):
	if event.is_action_pressed("mouse_1"):
		target = get_global_mouse_position()
		is_player_target = false

func _physics_process(_delta):	
	# velocity = position.direction_to(target) * speed
	look_at(target)
	
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
		is_player_target = true
