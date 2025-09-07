extends Button


func _on_pressed() -> void:
	Global.hp = 10
	Global.shibas = 0
	get_tree().change_scene_to_file("res://scenes/main_game.tscn")
