extends Node2D

var chicken = preload("res://Chicken/chicken.tscn")

func _ready():
	randomize()
		

func _process(delta):
	pass


func _on_timer_timeout():
	var chickenTemp = chicken.instantiate()
	chickenTemp.position = Vector2(randf_range(0, 1150), randf_range(0,500))
	add_child(chickenTemp)
