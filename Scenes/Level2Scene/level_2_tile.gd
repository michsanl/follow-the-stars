class_name Level2Tile
extends Control

func _ready():
	await get_tree().create_timer(randf()).timeout
	
	var tween = create_tween().set_loops() # infinite loops
	tween.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

	tween.tween_property(self, "position", self.position + Vector2.DOWN * 1.0, 1.0)
	tween.tween_property(self, "position", self.position + Vector2.UP * 1.0, 1.0)

func _gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.is_pressed():
		EventBus.tile_pressed.emit(self)

	if event is InputEventMouseButton and event.is_pressed():
		EventBus.tile_pressed.emit(self)
