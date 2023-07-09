extends Panel

func _ready():
	self.visible = false

func _input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused = !get_tree().paused
		self.visible = !self.visible
		$AudioStreamPlayer2D.play()
	
	


func _on_check_button_toggled(button_pressed):
	Music.stream_paused = !Music.stream_paused
	$AudioStreamPlayer2D.play()
