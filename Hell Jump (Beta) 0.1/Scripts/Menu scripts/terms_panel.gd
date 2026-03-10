extends Panel

func _ready() -> void:
	var config = ConfigFile.new()
	var _err = config.load("user://settings.cfg")
	var agreed = config.get_value("user", "agreed", false)
	
	if agreed:
		visible = false


func _on_agree_button_pressed() -> void:
	var config = ConfigFile.new()
	config.set_value("user", "agreed", true)
	config.save("user://settings.cfg")
	visible = false
