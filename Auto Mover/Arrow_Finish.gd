extends Area2D

#0 is left, 1 is up, 2 is right
@export var direction: int

var duration: float

func _ready():
	self.area_entered.connect(Callable(self, "_on_area_entered"))

func _on_area_entered(area):
	duration = area.get_parent().duration
	if direction == 0:
		$"../../../..".move_left.emit(duration)
	elif direction == 1:
		$"../../../..".move_up.emit(duration)
	else:
		$"../../../..".move_right.emit(duration)
	area.get_parent()._stop_and_shrink()
