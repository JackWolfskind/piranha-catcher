extends Node

onready var PiranhaFollow = preload("res://sprite/PiranhaFollow.tscn")
var linesList=[]
var points=0

func _ready():
	$HUD/Point.text += " " + String(points)
	$DelayTimer.start()
	var linesContainer = $Lines
	var i = int(0)
	for line in linesContainer.get_children():
		line.get_node("PathDelayTimer").set_wait_time(get_random_spawn_time())
		line.get_node("PathDelayTimer").start()
		linesList.append(line)
	
func get_random_spawn_time():
	randomize()
	return float(round(rand_range(5, 10)))

func get_random_index(minIndex, maxIndex):
	var randomIndex = round(rand_range(minIndex, maxIndex))
	return randomIndex

func spawn_random_prianha():
	var line = get_random_ready_line()
	if line:
		spawn_at_line(line)

func spawn_at_line(line):
	var piranhaFollow = PiranhaFollow.instance()
	piranhaFollow.set_offset(384.37)
	line.add_child(piranhaFollow)
	line.start()

func get_random_ready_line():
	var readyLines = []
	for line in linesList:
		if line.get_node("PathDelayTimer").is_stopped():
			readyLines.append(line)
			line.get_node("PathDelayTimer").set_wait_time(get_random_spawn_time())
			line.get_node("PathDelayTimer").start()
	if readyLines.size() > 0:
		var randomIndex = get_random_index(0, readyLines.size() -1)
		return readyLines[randomIndex]
	return null

func game_over():
	get_tree().change_scene("res://scenes/GameOver.tscn")
	pass

func _on_Deathzone_body_entered(body):
	game_over()



func _on_DelayTimer_timeout():
	spawn_random_prianha()
	$DelayTimer.start()


func _on_Player_death():
	game_over()

func _on_Player_point():
	points += 1
	$HUD/Point.text = "Points: " + String(points)
