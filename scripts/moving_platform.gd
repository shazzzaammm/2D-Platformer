extends Node2D

@export var offset:Vector2
@export var duration:float
@export var enabled:bool = true
@export var enable_with_player:bool = false
var tweening = false
var tween:Tween
var initial_position:Vector2

func _ready():
	initial_position = global_position
	if enabled:
		start_tween()


func start_tween():
	tweening = true
	enabled = true
	tween = get_tree().create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.set_loops().set_parallel(false)
	tween.tween_property($AnimatableBody2D, "position", offset, duration / 2)
	tween.tween_property($AnimatableBody2D, "position", Vector2.ZERO, duration / 2)
	print("tween started")

func stop_tween():
	if not tweening:
		return
	tweening = false
	enabled = false
	tween.kill()
	print("tween stopped")


func _physics_process(_delta):
	if initial_position == global_position and not enabled and tweening:
		tween.pause()

	elif enabled and not tweening:
		tween.play()


func _on_body_entered(body):
	if body is Player and enable_with_player:
		start_tween()


func _on_body_exited(body):
	if body is Player and enable_with_player:
		enabled = false

