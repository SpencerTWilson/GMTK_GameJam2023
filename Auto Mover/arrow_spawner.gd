extends Node2D

@export var arrow_to_spawn: PackedScene

func _spawn_arrow_with_duration(duration):
	var new_arrow = arrow_to_spawn.instantiate()
	$"..".add_child(new_arrow)
	new_arrow.duration = duration
	new_arrow.position.x += 15
