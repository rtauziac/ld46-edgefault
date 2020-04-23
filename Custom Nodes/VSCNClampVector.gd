tool
extends VisualScriptCustomNode

func _get_caption():
	return "Vector 3 Clamp01"

func _has_input_sequence_port():
	return false

func _get_output_sequence_port_count():
	return 0

func _get_input_value_port_count():
	return 1

func _get_input_value_port_name(idx):
	return "vector"

func _get_input_value_port_type(idx):
	return TYPE_VECTOR3

func _get_output_value_port_count():
	return 1

func _get_output_value_port_type(idx):
	return TYPE_VECTOR3

func _step(inputs, outputs, start_mode, working_mem):
	var vec: Vector3 = inputs[0]
	if vec.length() > 1:
		vec = vec.normalized()
	outputs[0] = vec
	return 0
