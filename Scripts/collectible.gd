class_name Collectible
extends Area2D

signal collected(source: Area2D)

@export var start_texture: Texture2D
@export var end_texture: Texture2D

@onready var audio = $AudioStreamPlayer2D
@onready var collider = $CollisionShape2D
@onready var view = $View
 
func _on_body_entered(_body: Node2D) -> void:
	await despawn()
	await spawn()


func spawn():
	var spawn_timer = randf_range(1.0, 2.0)
	await get_tree().create_timer(spawn_timer).timeout
	set_deferred("monitorable", true)
	set_deferred("monitoring", true)
	view.texture = start_texture
	show()


func despawn():
	set_deferred("monitorable", false)
	set_deferred("monitoring", false)
	view.texture = end_texture
	audio.play()
	await get_tree().create_timer(0.75).timeout
	audio.stop()
	hide()
	
	collected.emit(self)
	
