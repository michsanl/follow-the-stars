class_name StarAnimatedSrite
extends Sprite2D


func _ready():
	var tween = create_tween().set_loops() # infinite loops
	tween.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

	tween.tween_property(self, "position", self.position + Vector2.RIGHT * 5, 0.5)
	tween.tween_property(self, "position", self.position + Vector2.LEFT * 10, 1.0)
	tween.tween_property(self, "position", self.position, 0.5)
