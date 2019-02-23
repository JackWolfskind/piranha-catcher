extends RigidBody2D


signal hit

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass


func hit_target():
	hide()
	emit_signal("hit")
	$CollisionShape2D.disabled = true
	queue_free()


func _on_Visibility_screen_exited():
	hit_target()
	
