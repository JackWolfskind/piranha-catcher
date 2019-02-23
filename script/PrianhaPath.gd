extends Path2D

onready var follow = get_node("Piranha")
export var speed = 10

func _ready():
	set_process(true)

func _process(delta):
	var offset = follow.get_offset()
	
	follow.set_offset(follow.get_offset() - speed * delta)
