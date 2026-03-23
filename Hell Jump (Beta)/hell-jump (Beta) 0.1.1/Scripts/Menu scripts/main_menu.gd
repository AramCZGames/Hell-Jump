extends Control

@onready var main_menu: VBoxContainer = $main_menu
@onready var settings_menu: Panel = $"settings menu"
@onready var credits_menu: Panel = $"credits_menu"

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_select.tscn")

func _ready():
	main_menu.visible = true
	settings_menu.visible = false
	credits_menu.visible = false
	
func _on_options_button_pressed() -> void:
	main_menu.visible = false
	settings_menu.visible = true




func _on_back_button_pressed() -> void:
		main_menu.visible = true
		credits_menu.visible = false
		settings_menu.visible = false


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_credits_button_pressed() -> void:
		main_menu.visible = false
		credits_menu.visible = true
	
