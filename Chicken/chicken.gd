extends CharacterBody2D


const SPEED = 150
var runFlag = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	if runFlag:
		var direction = (self.position - player.position)
		direction = (self.position - player.position).normalized()
		if  direction.x > 0:
			get_node("AnimatedSprite2D").flip_h = true
		else:
			get_node("AnimatedSprite2D").flip_h = false
		velocity.x = direction.x * SPEED
	else:
		velocity.x = 0
	move_and_slide()


func _on_player_detection_body_entered(body):
	if body.name == "Player":
		player = get_node("../../Player/Player")
		runFlag = true


func _on_player_detection_body_exited(body):
	if body.name == "Player":
		player = get_node("../../Player/Player")
		runFlag = false


func _on_kill_chicken_body_entered(body):
	if body.name == "Player":
		get_node("../../Player/Player").killCounter += 1
		get_node("CollisionShape2D").set_deferred("disabled", true)
		get_node("PlayerDetection/CollisionShape2D").set_deferred("disabled", true)
		get_node("KillChicken/CollisionShape2D").set_deferred("disabled", true)
		var tween = get_tree().create_tween()
		var tween1 = get_tree().create_tween()
		var tween2 = get_tree().create_tween()
		tween.tween_property(self, "position", position - Vector2(0,45), 0.4)
		tween1.tween_property(self, "modulate:a", 0, 0.4)
		tween2.tween_property(self, "rotation", 45, 0.4).as_relative()
		tween.tween_callback(queue_free)
