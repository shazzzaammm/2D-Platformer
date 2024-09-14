extends Node2D


func change_scenes(source_scene:Node, desired_scene:PackedScene):
	add_child(desired_scene.instantiate())
	source_scene.queue_free()
