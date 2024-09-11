extends Node2D

@export var offset:Vector2
@export var duration:float
@export var start_delay:float = 0.0
@export var end_delay:float = 0.0
@export var auto_enable = true
@export var enable_with_player:bool = false
var enabled:bool = false
var tweening = false
var tween:Tween
var initial_position:Vector2

func _ready():
	initial_position = global_position
	enabled = auto_enable
	if enabled:
		start_tween()


func start_tween():
	tweening = true
	enabled = true
	tween = get_tree().create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.set_loops().set_parallel(false)
	tween.tween_property($AnimatableBody2D, "position", Vector2.ZERO, start_delay)
	tween.tween_property($AnimatableBody2D, "position", offset, duration)
	tween.tween_property($AnimatableBody2D, "position", offset, end_delay)
	tween.tween_property($AnimatableBody2D, "position", Vector2.ZERO, duration)

func stop_tween():
	if not tweening:
		return
	tweening = false
	enabled = false
	tween.kill()


func _physics_process(_delta):
	if initial_position == $AnimatableBody2D.global_position and not enabled and tweening:
		stop_tween()

	elif enabled and not tweening:
		start_tween()


func _on_body_entered(body):
	if body is Player and enable_with_player:
		enabled = true


func _on_body_exited(body):
	if body is Player and enable_with_player:
		enabled = false

