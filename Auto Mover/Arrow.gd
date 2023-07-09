extends Sprite2D

@export var speed: float = 100

var duration: float = 1

var stopped = false

var tween: Tween

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !stopped:
		position.y += speed * delta
		

func _stop_and_shrink():
	stopped = true
	tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(0,0), duration).set_ease(Tween.EASE_IN)
	tween.finished.connect(Callable(self, "_destroy_me_daddy"))

func _destroy_me_daddy():
	self.queue_free()
