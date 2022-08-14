class_name Gate

extends KinematicBody2D

signal open_gate

var isActive: bool = true
var isOpen: bool = false
var isWorking: bool

func _action():
	isWorking = true
	print("clicou aqui, hein?")
	isWorking = false
	isOpen = !isOpen

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("mouse_1"):
		_action()
