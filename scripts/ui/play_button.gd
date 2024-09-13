extends Button

@export var game_scene:PackedScene

func _on_pressed() -> void:
	var scene := game_scene.instantiate()
	get_tree().root.add_child(scene)
	get_parent().queue_free()
	
