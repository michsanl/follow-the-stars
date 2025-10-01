class_name Collectible
extends Area2D

signal collected(this_node: Area2D)

@export var end_texture: Texture2D

@onready var audio = $AudioStreamPlayer2D
@onready var collider = $CollisionShape2D
@onready var view = $View
 
func _on_body_entered(_body: Node2D) -> void:
	audio.play()
	view.texture = end_texture
	set_deferred("monitorable", false)
	set_deferred("monitoring", false)
	await get_tree().create_timer(0.75).timeout
	collected.emit(self)
	self.queue_free()
	
