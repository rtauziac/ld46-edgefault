extends Object

var nodeDic = {}

func setNode(name: String, node: Node):
	nodeDic[name] = node

func getNode(name: String):
	return nodeDic[name]
