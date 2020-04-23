tool
extends VisualScriptCustomNode

export (Array) var sounds: Array = [
	load("res://soundeffects/soundeffectsedgefault-01.ogg"),
	load("res://soundeffects/soundeffectsedgefault-02.ogg"),
	load("res://soundeffects/soundeffectsedgefault-03.ogg"),
	load("res://soundeffects/soundeffectsedgefault-04.ogg")
]

# Display
func _get_caption():
	return "PlayFootstepSound"

# Flow
func _has_input_sequence_port():
	return true

func _get_output_sequence_port_count():
	return 1

# Parameters
func _get_input_value_port_count():
	return 1

func _get_input_value_port_name(idx):
	return "AudioStreamPlayer3D"

func _get_input_value_port_type(idx):
	return TYPE_OBJECT

func _step(inputs, outputs, start_mode, working_mem):
	var player: AudioStreamPlayer3D = inputs[0]
	var soundVariant = sounds[randi() % sounds.size()]
	player.stream = soundVariant
	player.pitch_scale = rand_range(0.9, 1.1)
	player.play()
	return 0
