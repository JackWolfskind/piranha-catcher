extends RigidBody2D


signal not_catched

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass


func hit_target():
	hide()
	$CollisionShape2D.disabled = true
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Visibility_screen_exited():
	hit_target()
	emit_signal("not_catched")
	queue_free()
