extends Camera3D

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		var mouse_pos = get_viewport().get_mouse_position()
		var ray_query = PhysicsRayQueryParameters3D.new()
		ray_query.from = project_ray_origin(mouse_pos)
		ray_query.to = project_ray_origin(mouse_pos) + project_ray_normal(mouse_pos) * 10
		ray_query.collide_with_areas = true
		var raycast_result = get_world_3d().direct_space_state.intersect_ray(ray_query)
		if raycast_result and raycast_result.collider.is_in_group("Ball"):
			if raycast_result.collider.get_parent().linear_velocity.y < 3:
				raycast_result.collider.get_parent().linear_velocity += Vector3(randf_range(-5,5),5,randf_range(-5,5))

func _process(delta: float) -> void:
	var mouse_pos = get_viewport().get_mouse_position()
	mouse_pos = (mouse_pos - get_viewport().get_visible_rect().size/2) / (get_viewport().get_visible_rect().size/2)
	var target = Vector2(mouse_pos.x, -mouse_pos.y) * 2
	position = Vector3(target.x, 0, target.y)
