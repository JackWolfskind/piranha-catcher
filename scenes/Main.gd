extends Node

onready var PiranhaFollow = preload("res://sprite/PiranhaFollow.tscn")
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var linesList=[]
var lineTimerList
func _ready():
	$DelayTimer.start()
	var linesContainer = $Lines
	var i = int(0)
	for line in linesContainer.get_children():
		linesList.append(line)
	var linesCount = linesList.size()
	lineTimerList = []
	lineTimerList.resize(linesCount)
	for i in range(linesCount):
		lineTimerList[i] = i / 10
	
func get_random_spawn_time():
	randomize()
	return float(round(rand_range(5, 10)))

func discrease_timers(delta):
	for i in range(lineTimerList.size()):
		var timer = lineTimerList[i]
		if timer > 0:
			lineTimerList[i] -= delta


func get_random_index(minIndex, maxIndex):
	var randomIndex = round(rand_range(minIndex, maxIndex))
	return randomIndex


func spawn_random_prianha():
	var line = 	get_random_ready_line()
	if line:
		spawn_at_line(line)
	
	
func spawn_at_line(line):
	var piranhaFollow = PiranhaFollow.instance()
	piranhaFollow.set_offset(384.37)
	line.add_child(piranhaFollow)
	line.start()

	
func randomize_line_timer(lineTimerIndex):
	lineTimerList[lineTimerIndex] = get_random_spawn_time()
	
func get_random_ready_line():
	var readyLines = []
	for i in range(linesList.size() -1):
		if can_line_spawn(i):
			readyLines.append(linesList[i])
	if readyLines.size() > 0:
		var randomIndex = get_random_index(0, readyLines.size() -1)
		return readyLines[randomIndex]
	return null
	
func can_line_spawn(lineIndex):
	var timer = lineTimerList[lineIndex]
	if timer <= 0:
		return true
	return false


func game_over():
	get_tree().change_scene("res://scenes/GameLogo.tscn")
	pass

func _on_Deathzone_body_entered(body):
	game_over()


func _on_DelayTimer_timeout():
	discrease_timers(0.1)
	spawn_random_prianha()
	$DelayTimer.start()
	
