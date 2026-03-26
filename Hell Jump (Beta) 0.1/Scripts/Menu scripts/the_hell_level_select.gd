extends Control


func _on__pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/The hell/Level1.tscn")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_select.tscn")
