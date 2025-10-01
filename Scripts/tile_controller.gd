class_name TileController
extends Node

signal tile_pressed(position: Vector2)

@export var view: TileView

func _ready() -> void:
	view.tile_pressed.connect(_on_tile_pressed)


func _on_tile_pressed(position: Vector2):
	tile_pressed.emit(position)
