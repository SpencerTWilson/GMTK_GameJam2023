extends Area2D

func _on_body_exited(_body):
	get_tree().change_scene_to_file("res://UI Screens/game_over_screen.tscn")
  
