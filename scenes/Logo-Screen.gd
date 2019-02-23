extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$StartTimer.start()
	pass
	

func _on_StartTimer_timeout():
	get_tree().change_scene("res://scenes/GameLogo.tscn")
