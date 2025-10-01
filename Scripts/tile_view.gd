class_name TileView
extends Node

signal tile_pressed(position: Vector2)

@export var buttons: Array[TileButton] = []

func _ready() -> void:
	for i in range(buttons.size()):
		buttons[i].initialize(i)
		buttons[i].pressed_button.connect(_on_pressed_button)


func _on_pressed_button(position: Vector2):
	tile_pressed.emit(position)
	
	
