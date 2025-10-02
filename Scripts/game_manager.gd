class_name GameManager
extends Node

@export var tile: Tile
@export var player: Player

func _ready() -> void:
	tile.tile_pressed.connect(_on_tile_pressed)


func _on_tile_pressed(position: Vector2):
	var final_pos = position + Vector2(64.0, 64.0)
	
	if final_pos.x > player.position.x:
		player.face_left(false)
	elif final_pos.x < player.position.x:
		player.face_left(true)
		
	player.perform_move_position(final_pos)
