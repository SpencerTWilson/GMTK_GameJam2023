extends Area2D

var next_duration: float = 1

func _on_area_entered(area):
	$"../../../..".move_left.emit(next_duration)
	#area.get_parent().duration = next_duration
