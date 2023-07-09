extends Sprite2D

var tween: Tween

@export var total_drops: int = 1
var num_drops: int = 0

var can_be_dragged: bool = true
var is_being_dragged = false
var dragging_diff: Vector2 = Vector2(0,0)

func _process(_delta):
	if is_being_dragged:
		tween = get_tree().create_tween()
		tween.tween_property(self, "position", get_global_mouse_position() - dragging_diff, 0.1)

func activate():
	tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(2, 2), 0.1).set_ease(Tween.EASE_OUT)

func dropped():
	$StaticBody2D/CollisionShape2D.disabled = false
	
	num_drops += 1
	if num_drops >= total_drops:
		can_be_dragged = false
		texture = load("res://Art/Placable_Final.png")
	
func picked_up():
	$StaticBody2D/CollisionShape2D.disabled = true
