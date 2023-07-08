extends Button

@export var lvl_scene: String

func _pressed():
	get_tree().change_scene_to_file(lvl_scene)
