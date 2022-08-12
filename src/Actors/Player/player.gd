class_name Player
extends KinematicBody2D

export var speed: int = 100
var velocity: Vector2 = Vector2.ZERO

func _ready():
	pass


func _physics_process(_delta) -> void:
	get_input()
	velocity = move_and_slide(velocity)


func get_input() -> void:
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	
	velocity = velocity.normalized() * speed

