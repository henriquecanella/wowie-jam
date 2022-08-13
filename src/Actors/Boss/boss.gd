extends Area2D

var dialog = Dialogic.start("introduction")


func _on_Boss_body_entered(body) -> void:
	if body.name == "Player":
		Singleton.can_act = false
		add_child(dialog)


func _on_Boss_body_exited(_body) -> void:
	Singleton.can_act = true
