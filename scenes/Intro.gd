extends Node2D

func _ready():
	pass

func _on_IntroTimer_timeout():
	get_tree().change_scene("res://scenes/GameLogo.tscn")
