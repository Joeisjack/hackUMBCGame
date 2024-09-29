extends Area2D

@onready var animation_player: AnimationPlayer = $deadPlayer/AnimationPlayer
@onready var label: Label = $Label
@onready var death_timer: Timer = $DeathTimer


func _on_body_entered(body: Node2D) -> void:
	Engine.time_scale = 0.5
	animation_player.play("playerDeath")
	label.visible = true
	death_timer.start()

func _on_death_timer_timeout() -> void:
	var level = get_parent().name
	Engine.time_scale = 1
	
	if level == "level1_1":
		get_tree().reload_current_scene()
	elif level == "level1_2":
		get_tree().change_scene_to_file("res://Scenes/level_1_1.tscn")
	elif level == "level2_1":
		get_tree().change_scene_to_file("res://Scenes/level_1_2.tscn")
	elif level == "level2_2":
		get_tree().change_scene_to_file("res://Scenes/level_2_1.tscn")
	elif level == "level3_1":
		get_tree().change_scene_to_file("res://Scenes/level_2_2.tscn")
	elif level == "level3_2":
		get_tree().change_scene_to_file("res://Scenes/level_3_1.tscn")
	elif level == "level4_1":
		get_tree().change_scene_to_file("res://Scenes/level_3_2.tscn")
	elif level == "level4_2":
		get_tree().change_scene_to_file("res://Scenes/level_4_1.tscn")
	elif level == "level5_1":
		get_tree().change_scene_to_file("res://Scenes/level_4_2.tscn")
	elif level == "level5_2":
		get_tree().change_scene_to_file("res://Scenes/level_5_1.tscn")
	elif level == "level6_1":
		get_tree().change_scene_to_file("res://Scenes/level_5_2.tscn")
	elif level == "level6_2":
		get_tree().change_scene_to_file("res://Scenes/level_6_1.tscn")
