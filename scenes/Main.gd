extends Node

export var delay = 0.77
onready var PiranhaFollow = preload("res://sprite/PiranhaFollow.tscn")
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var linesList=[]
var lineTimerList
func _ready():
	
	var linesContainer = $Lines
	var i = int(0)
	for line in linesContainer.get_children():
		linesList.append(line)
	var linesCount = linesList.size()
	lineTimerList = []
	lineTimerList.resize(linesCount)
	for i in range(linesCount):
		lineTimerList[i] = get_random_spawn_time()
	
func get_random_spawn_time():
	return float(rand_range(0.1, 1))

func discrease_timers(delta):
	var i = 0;
	for line in linesList:
		var timer = lineTimerList[i]
		lineTimerList[i] = timer - delta
		i = i + 1

func _process(delta):
	discrease_timers(delta * delay)
	var line = get_line_with_timeout()
	if line:
		spawn_at_line(line)	

func get_random_line_index():
	var countOfLines = linesList.size()
	var randomIndex = rand_range(0, countOfLines)
	return randomIndex


func spawn_random_prianha():
	var lineIndex = get_random_line_index()
	var line = linesList[lineIndex]	
	spawn_at_line(line)
	
	
func spawn_at_line(line):
	var piranhaFollow = PiranhaFollow.instance()
	piranhaFollow.set_offset(384.37)
	line.add_child(piranhaFollow)
	line.start()

	
func get_line_with_timeout():
	var i = 0;
	for line in linesList:
		var timer = lineTimerList[i]
		if timer <= 0:
			lineTimerList[i] = get_random_spawn_time()
			return line
		i = i + 1
	return null
