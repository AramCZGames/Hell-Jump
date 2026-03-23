extends Control


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/the_hell_level_select.tscn")


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
