class_name Player
extends KinematicBody2D

export var speed: int = 75

var velocity: Vector2 = Vector2.ZERO

var game_controller = GameController.new()

onready var sprite = get_node("Sprite")
onready var animation = get_node("AnimationPlayer")

func _physics_process(_delta) -> void:
	move_player()
	update_sprite()


func move_player() -> void:
	if Singleton.can_act:
		velocity = game_controller.get_movement_input().normalized() * speed
		velocity = move_and_slide(velocity)


func update_sprite() -> void:
	if velocity.y < 0:
		sprite.texture = load("res://assets/Player/back.png")
		if self.scale.x > 0:
			animation.play("move-right-front")
		else:
			animation.play("move-left-front")
	if velocity.y > 0:
		sprite.texture = load("res://assets/Player/front.png")
		if self.scale.x > 0:
			animation.play("move-right-front")
		else:
			animation.play("move-left-front")

	if velocity.x > 0:
		animation.play("move-right-front")
	if velocity.x < 0:
		animation.play("move-left-front")

	if Singleton.can_act == false:
		animation.stop()
