extends Node
@onready var menu: Panel = $"../GameMenu"

func _ready():
	menu.visible = false


	if Input.is_action_just_pressed("show_menu"):
		menu.visible = true
