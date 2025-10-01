class_name TileButton
extends Button

signal pressed_button(index: Vector2)

var index: int

func initialize(new_index: int):
	index = new_index


func _on_pressed() -> void:
	pressed_button.emit(global_position)
