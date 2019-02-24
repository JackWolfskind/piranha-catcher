extends CanvasLayer

onready var PiranhaFollow = preload("res://sprite/PiranhaFollow.tscn")

func _ready():
	$PiranhaPath.get_node("PathDelayTimer").start()
	$PiranhaPath2.get_node("PathDelayTimer").start()
	$PiranhaPath3.get_node("PathDelayTimer").start()
	pass

func _process(delta):
	spawn($PiranhaPath)
	spawn($PiranhaPath2)
	spawn($PiranhaPath3)

func spawn(line):
	if line.get_node("PathDelayTimer").is_stopped():
		spawn_at_line(line)
		line.get_node("PathDelayTimer").start()

func spawn_at_line(line):
	var piranhaFollow = PiranhaFollow.instance()
	piranhaFollow.set_offset(384.37)
	line.add_child(piranhaFollow)
	line.start()