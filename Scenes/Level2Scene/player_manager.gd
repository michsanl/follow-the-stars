class_name PlayerManager
extends Node

@onready var player = $"../PlayerController"

func _ready() -> void:
	EventBus.tile_pressed.connect(_on_tile_pressed)


func _on_tile_pressed(source: Level2Tile):
	var final_pos = source.global_position + Vector2(64.0, 64.0)
	
	if final_pos.x > player.position.x:
		player.face_left(false)
	elif final_pos.x < player.position.x:
		player.face_left(true)
		
	player.perform_move_position(final_pos)
