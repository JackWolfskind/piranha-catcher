extends Path2D

export var speed = 10

func _ready():
	set_process(false)

func get_piranha_list():
	var childrenList = get_children();
	var prianhaList = []
	for piranha in childrenList:
		if node_is_path_2D_follow(piranha):
			prianhaList.append(piranha)
	return prianhaList

func node_is_path_2D_follow(node):
	var nodeClass = node.get_class()
	return nodeClass == "PathFollow2D"

func _process(delta):
	if get_child_count() > 0:
		var piranhaList = get_piranha_list()
		for piranha in piranhaList:	
			move_piranha(piranha, delta)
	
func move_piranha(piranha, delta):
		var offset = piranha.get_offset()
		piranha.set_offset(piranha.get_offset() - speed * delta)

func start():
	set_process(true)