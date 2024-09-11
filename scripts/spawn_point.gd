extends Area2D
class_name SpawnPoint

@export var player:Player
@onready var enter_effect:CPUParticles2D = $EnterEffect

func _on_body_entered(body):
	if body is Player:
		body.get_node("PlayerDeath").spawn_point = self
		enter_effect.emitting = true
