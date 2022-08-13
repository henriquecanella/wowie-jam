class_name Player
extends KinematicBody2D

export var speed: int = 100

var velocity: Vector2 = Vector2.ZERO

var game_controller = GameController.new()

func _physics_process(_delta) -> void:
	move_player()


func move_player() -> void:
	if Singleton.can_act:
		velocity = game_controller.get_movement_input().normalized() * speed
		velocity = move_and_slide(velocity)

