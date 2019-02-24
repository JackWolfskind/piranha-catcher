extends Area2D

signal fish_entered

onready var splat_effect = $TargetCollsion/splat
onready var splat_timer = $splatTimer

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func show_splat():
	splat_effect.show()
	if splat_timer.is_stopped():
		splat_timer.start()
		return
	splat_timer.set_wait_time(splat_timer.wait_time + splat_timer.time_left)

func _on_TargetArea_piranha_entered(body):
	if body.get_name() == "Piranha" || body.get_name() == "Fish":
		body.hit_target()
		show_splat()
		emit_signal("fish_entered")

func _on_splatTimer_timeout():
	splat_timer.set_wait_time(0.2)
	splat_timer.stop()
	splat_effect.hide()