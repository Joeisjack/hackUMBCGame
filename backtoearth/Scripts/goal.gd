extends Area2D

func _on_body_entered(body: Node2D) -> void:
	var level = get_parent().name
	
	if level == "level1_1":
		get_tree().change_scene_to_file("res://Scenes/level_1_2.tscn")
	elif level == "level1_2":
		get_tree().change_scene_to_file("res://Scenes/level_2_1.tscn")
	elif level == "level2_1":
		get_tree().change_scene_to_file("res://Scenes/level_2_2.tscn")
	elif level == "level2_2":
		get_tree().change_scene_to_file("res://Scenes/level_3_1.tscn")
	elif level == "level3_1":
		get_tree().change_scene_to_file("res://Scenes/level_3_2.tscn")
	elif level == "level3_2":
		get_tree().change_scene_to_file("res://Scenes/level_4_1.tscn")
	elif level == "level4_1":
		get_tree().change_scene_to_file("res://Scenes/level_4_2.tscn")
	elif level == "level4_2":
		get_tree().change_scene_to_file("res://Scenes/level_5_1.tscn")
	elif level == "level5_1":
		get_tree().change_scene_to_file("res://Scenes/level_5_2.tscn")
	elif level == "level5_2":
		get_tree().change_scene_to_file("res://Scenes/level_6_1.tscn")
	elif level == "level6_1":
		get_tree().change_scene_to_file("res://Scenes/level_6_2.tscn")
	elif level == "level6_2":
		get_tree().change_scene_to_file("res://Scenes/win.tscn")
