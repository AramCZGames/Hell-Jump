extends HSlider

@export var audio_bus_name: String = "SFX"

var audio_bus_id: int = -1

func _ready() -> void:
	audio_bus_id = AudioServer.get_bus_index(audio_bus_name)

	value = db_to_linear(AudioServer.get_bus_volume_db(audio_bus_id))

	min_value = 0.0
	max_value = 1.0
	step = 0.01

	if not is_connected("value_changed", Callable(self, "_on_value_changed")):
		connect("value_changed", Callable(self, "_on_value_changed"))

func _on_value_changed(value: float) -> void:
	if audio_bus_id == -1:
		return

	AudioServer.set_bus_volume_db(audio_bus_id, linear_to_db(value))
