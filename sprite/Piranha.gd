extends RigidBody2D


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


func _on_Piranha_body_entered(body):
	var foo = ""
	pass # replace with function body


func _on_Piranha_body_shape_entered(body_id, body, body_shape, local_shape):
	var foo = ""
	pass # replace with function body


func _on_Visibility_screen_exited():
	queue_free()
