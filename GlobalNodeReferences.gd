extends Node

var nodeDic = {}

func setNode(name: String, node: Node):
	nodeDic[name] = node

func getNode(name: String):
	return nodeDic[name]

func _process(delta):
	if Input.is_action_just_pressed("escape"):
		get_tree().quit(0)
