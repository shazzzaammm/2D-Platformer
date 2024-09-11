extends Node2D
@onready var player:Player = get_parent()
var spawn_point:SpawnPoint

func _process(delta):
	if Input.is_action_just_pressed("Reset") and spawn_point:
		kill_player()

func kill_player():
	player.global_position = spawn_point.global_position
