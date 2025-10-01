class_name Player
extends CharacterBody2D

@export var move_duration: float = 0.125

var move_dir: Vector2 = Vector2.ZERO
var is_moving: bool = false

@onready var animation = $ViewContainer/AnimatedSprite2D
@onready var shadow = $ViewContainer/Shadow
@onready var view_container = $ViewContainer
@onready var sound = $AudioStreamPlayer2D
 
func _process(_delta: float) -> void:
	if is_moving: return
	
	if Input.is_action_just_pressed("ui_up"):
		perform_dash(Vector2.UP)
	if Input.is_action_just_pressed("ui_down"):
		perform_dash(Vector2.DOWN)
	if Input.is_action_just_pressed("ui_right"):
		perform_dash(Vector2.RIGHT)
		face_left(false)
	if Input.is_action_just_pressed("ui_left"):
		perform_dash(Vector2.LEFT)
		face_left(true)


func perform_move_position(final_pos: Vector2):
	is_moving = true
	
	sound.play()
	animation.play("Dash")
	await move_to_position(final_pos)
	animation.play("Idle")
	
	is_moving = false


func perform_dash(dir: Vector2):
	is_moving = true
	
	sound.play()
	animation.play("Dash")
	await move_to_direction(dir)
	animation.play("Idle")
	
	is_moving = false


func move_to_position(pos: Vector2):
	var tween = create_tween()
	tween.tween_property(
		self, 
		"position", 
		pos, 
		move_duration
	).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	await tween.finished


func move_to_direction(direction: Vector2):
	var tween = create_tween()
	tween.tween_property(
		self, 
		"position", 
		position + direction * 132, 
		move_duration
	).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	await tween.finished
	

func face_left(condition: bool):
	if condition:
		view_container.scale.x = -1
	else:
		view_container.scale.x = 1
