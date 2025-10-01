class_name Collectible
extends Area2D

@export var start_texture: Texture2D
@export var end_texture: Texture2D

@onready var audio = $AudioStreamPlayer2D
@onready var sprite: Sprite2D = $Sprite2D
 
func _on_body_entered(_body: Node2D) -> void:
	sprite.texture = end_texture
	audio.play()
	hide()
	await get_tree().create_timer(1.0).timeout
	process_mode = Node.PROCESS_MODE_DISABLED 
	
