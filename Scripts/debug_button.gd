class_name DebugButton
extends Control

@export var main_menu: PackedScene
@export var level_01: PackedScene
@export var level_02: PackedScene
@export var level_03: PackedScene
@export var level_04: PackedScene


func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_packed(main_menu)


func _on_level_01_button_pressed() -> void:
	#var next_scene = preload("res://Scenes/main_scene_2D.tscn")
	get_tree().change_scene_to_packed(level_01)


func _on_level_02_button_pressed() -> void:
	get_tree().change_scene_to_packed(level_02)


func _on_level_03_button_pressed() -> void:
	get_tree().change_scene_to_packed(level_03)


func _on_level_04_button_pressed() -> void:
	get_tree().change_scene_to_packed(level_04)
