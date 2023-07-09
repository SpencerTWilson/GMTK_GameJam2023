extends Button

@export var lvl_scene: String

func _ready():
	HaveWon.has_won = false

func _pressed():
	$AudioStreamPlayer2D.play()
	await $AudioStreamPlayer2D.finished
	get_tree().change_scene_to_file(lvl_scene)
