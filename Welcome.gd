extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "The Goal is to eat 20 Chicken. Get chompin!"
	await get_tree().create_timer(4.0).timeout
	self.queue_free()
