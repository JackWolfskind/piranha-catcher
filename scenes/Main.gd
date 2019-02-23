extends Node


onready var PiranhaFollow = preload("res://sprite/PiranhaFollow.tscn")
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var linesList=[]
func _ready():
	$SpawnTimer.start()
	var linesContainer = $Lines
	for line in linesContainer.get_children():
		linesList.append(line)
	pass

func _process(delta):
	pass

func get_random_line_index():
	var countOfLines = linesList.size()
	var randomIndex = rand_range(0, countOfLines)
	return randomIndex


func spawn_random_prianha():
	var lineIndex = get_random_line_index()
	var line = linesList[lineIndex]	
	var piranhaFollow = PiranhaFollow.instance()
	piranhaFollow.set_offset(384.37)
	line.add_child(piranhaFollow)
	line.start()
	

func _on_SpawnTimer_timeout():
	spawn_random_prianha()
