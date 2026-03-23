extends Control

@onready var main_menu: VBoxContainer = $main_menu
@onready var settings_menu: Panel = $"settings menu"
@onready var credits_menu: Panel = $"credits_menu"
@onready var x: Button = $Exit_button
@onready var YT: TextureButton = $Youtube
@onready var Twitter: TextureButton = $Twitter
@onready var Itch: TextureButton = $Itch

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_select.tscn")

func _ready():
	main_menu.visible = true
	settings_menu.visible = false
	credits_menu.visible = false
	x.visible = true
	YT.visible = true
	Itch.visible = true
	Twitter.visible = true

func _on_options_button_pressed() -> void:
	main_menu.visible = false
	settings_menu.visible = true
	x.visible = false
	YT.visible = false
	Itch.visible = false
	Twitter.visible = false

func _on_back_button_pressed() -> void:
		main_menu.visible = true
		credits_menu.visible = false
		settings_menu.visible = false
		x.visible = true
		YT.visible = true
		Itch.visible = true
		Twitter.visible = true

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_credits_button_pressed() -> void:
		main_menu.visible = false
		credits_menu.visible = true
		x.visible = false
		YT.visible = false
		Itch.visible = false
		Twitter.visible = false

func _on_youtube_pressed() -> void:
	OS.shell_open("https://www.youtube.com/@AramCZGames")

func _on_itch_pressed() -> void:
	OS.shell_open("https://aramczgames.itch.io")

func _on_twitter_pressed() -> void:
	OS.shell_open("https://x.com/aramczgames")
	
