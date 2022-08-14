extends Control



func _on_Button_pressed():
	self.get_tree().change_scene("res://src/Levels/Level_1/level_1.tscn")


func _on_Button2_pressed():
	self.get_tree().quit()
