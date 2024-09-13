extends Area2D

@export var desired_height:float

func launch_player(player:Player):
	player.velocity.y = 2.0 * -desired_height
	player.can_dash = true


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		launch_player(body)
