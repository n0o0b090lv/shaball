extends Node3D

var shiba_ball = preload("res://scenes/shiba_ball.tscn")
var timer = 10
func _process(delta: float) -> void:
	timer += delta
	if timer > 5:
		Global.shibas += 1
		timer = 0
		var ball : RigidBody3D = shiba_ball.instantiate()
		add_child(ball)
		ball.linear_velocity.x += randf_range(-1,1)
		ball.linear_velocity. y += 5
		ball.linear_velocity.z += randf_range(-1,1)
