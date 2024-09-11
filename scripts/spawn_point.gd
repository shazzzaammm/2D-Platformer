extends Area2D
class_name SpawnPoint

@export var player:Player

func _on_body_entered(body):
	if body is Player:
		body.get_node("PlayerDeath").spawn_point = self
