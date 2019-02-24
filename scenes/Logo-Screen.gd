extends CanvasLayer

func _ready():
	$StartTimer.start()
	pass
	

func _on_StartTimer_timeout():
	get_tree().change_scene("res://scenes/Intro.tscn")
