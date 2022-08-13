extends Area2D

var dialog = Dialogic.start("introduction")
var can_talk = true

func _on_Boss_body_entered(body) -> void:
	if body.name == "Player" and can_talk:
		Singleton.can_act = false
		add_child(dialog)
		dialog.connect("dialogic_signal", self, "dialog_listener")

func dialog_listener(string):
	match string:
		"finish_dialogue":
			Singleton.can_act = true
			can_talk = false
