extends Area2D

func _on_body_exited(_body):
	if !HaveWon.has_won:
		get_tree().change_scene_to_file("res://UI Screens/game_over_screen.tscn")
  
