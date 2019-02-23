extends Area2D

signal fish_entered

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_TargetArea_piranha_entered(body):
	if body.get_name() == "Piranha":
		body.hit_target()
		emit_signal("fish_entered")