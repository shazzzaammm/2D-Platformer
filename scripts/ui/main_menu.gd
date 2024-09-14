extends CanvasGroup
@export var level_scene:PackedScene

func play():
	get_parent().change_scenes(self, level_scene)
