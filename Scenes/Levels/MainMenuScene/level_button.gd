class_name LevelButton
extends Control

@onready var level1 = preload("res://Scenes/Levels/Level1Scene/level_1_scene.tscn")
@onready var level2 = preload("res://Scenes/Levels/Level2Scene/level_2_scene.tscn")
@onready var level3 = preload("res://Scenes/Levels/Level3Scene/level_3_scene.tscn")
@onready var level4 = preload("res://Scenes/Levels/Level4Scene/level_4_scene.tscn")


func _on_level_pressed() -> void:
	get_tree().change_scene_to_packed(level1)


func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_packed(level2)


func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_packed(level3)


func _on_level_4_pressed() -> void:
	get_tree().change_scene_to_packed(level4)
