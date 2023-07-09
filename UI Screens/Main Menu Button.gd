extends Button

func _pressed():
	$AudioStreamPlayer2D.play()
	await $AudioStreamPlayer2D.finished
	get_tree().change_scene_to_file("res://UI Screens/Main Menu.tscn")
