extends RigidBody2D


signal hit

func _ready():
	add_to_group("fish")
	pass


func hit_target():
	hide()
	emit_signal("hit")
	$DeathCollision.disabled = true
	$PointCollision.disabled = true
	queue_free()

