extends Node2D

@onready var Tutorial: Panel = $Tutorial

func _ready() -> void:
	Tutorial.process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	Tutorial.visible = true
	get_tree().paused = true

func _on_ok_button_pressed() -> void:
	Tutorial.visible = false
	get_tree().paused = false
