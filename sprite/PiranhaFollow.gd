extends PathFollow2D


onready var Piranha = preload("res://sprite/Piranha.tscn")
onready var Fish = preload("res://sprite/Fish.tscn")

func _ready():
	var fish
	var random = int(round(rand_range(0,1)))
	if random == 0:
		fish = Piranha.instance()	
	if random == 1:
		fish = Fish.instance()	
	add_child(fish)