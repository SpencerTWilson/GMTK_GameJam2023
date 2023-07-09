extends Control

signal move_left
signal move_up
signal move_right

var movement_track: Dictionary
var time_stamp: float = 0

@onready var left_spawner = $HBoxContainer/Arrow_Channel_Left/Arrow_Spawner
@onready var up_spawner = $HBoxContainer/Arrow_Channel_Up/Arrow_Spawner
@onready var right_spawner = $HBoxContainer/Arrow_Channel_Right/Arrow_Spawner

func _ready():
	movement_track = $"..".times_dictionary
	$Timer.timeout.connect(Callable(self, "_time_and_spawn"))
	_time_and_spawn()
	
func _time_and_spawn():
	if typeof(movement_track[time_stamp]) != TYPE_ARRAY:
		if !HaveWon.has_won:
			get_tree().change_scene_to_file("res://UI Screens/game_over_screen.tscn")
	
	var next_time_stamp = get_duration()
	var duration = next_time_stamp - time_stamp
	$Timer.wait_time = duration
	$Timer.start()
	
	if movement_track[time_stamp][0]:
		left_spawner._spawn_arrow_with_duration(duration)
	if movement_track[time_stamp][1]:
		up_spawner._spawn_arrow_with_duration(duration)
	if movement_track[time_stamp][2]:
		right_spawner._spawn_arrow_with_duration(duration)
	time_stamp = next_time_stamp
		
func get_duration():
	var next_time = 100000
	
	for item in movement_track.keys():
		if item > time_stamp:
			if item < next_time:
				next_time = item
	return next_time
