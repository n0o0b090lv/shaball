extends Label

var time = 0
func _process(delta: float) -> void:
	text = "Shibas sent to space: " + str(Global.shibas) + "\nShiba lifes: " + str(Global.hp)
	time += delta
	modulate = Color(1,1,1, sin(time)/4+0.5)
	if Global.hp <= 0:
		get_tree().change_scene_to_file("res://scenes/restart.tscn")
