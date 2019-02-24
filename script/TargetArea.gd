extends Area2D

signal fish_entered

onready var splat_effect = $TargetCollsion/splat
onready var damage_effect = $TargetCollsion/damage
onready var animation_timer = $animationTimer

export var SHOW_SPLASH = true
export var SHOW_DAMAGE = false

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
	splat_effect.play()
	if animation_timer.is_stopped():
		animation_timer.start()
		return
	animation_timer.set_wait_time(animation_timer.wait_time + animation_timer.time_left)
	
func show_damage():
	damage_effect.show()
	damage_effect.play()
	if animation_timer.is_stopped():
		animation_timer.start()
		return
	animation_timer.set_wait_time(animation_timer.wait_time + animation_timer.time_left)

func _on_TargetArea_piranha_entered(body):
	if body.get_name() == "Piranha" || body.get_name() == "Fish":
		body.hit_target()
		if SHOW_SPLASH:
			show_splat()
		if SHOW_DAMAGE:
			show_damage()
		emit_signal("fish_entered")

func _on_splatTimer_timeout():
	animation_timer.set_wait_time(0.2)
	animation_timer.stop()
	splat_effect.hide()
	splat_effect.stop()
	damage_effect.hide()
	damage_effect.stop()