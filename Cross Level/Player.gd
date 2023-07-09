extends CharacterBody2D

@export var pressing_right: bool = true
@export var pressing_left: bool = false
@export var pressing_jump: bool = false

@export var gravity: float

@export var player_acceleration: float
@export var player_jump_speed: float 
@export var player_top_speed: float

@export var velocity_multiplier: float = 100

@export var input_timer: Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	#make all numbers for velocity better
	player_acceleration *= velocity_multiplier
	gravity *= velocity_multiplier
	player_top_speed *= velocity_multiplier
	player_jump_speed *= velocity_multiplier
	
	#get the movement signals
	get_node("../Auto_Move_Track_Manager").move_left.connect(Callable(self, "_start_move_left"))
	get_node("../Auto_Move_Track_Manager").move_up.connect(Callable(self, "_start_move_up"))
	get_node("../Auto_Move_Track_Manager").move_right.connect(Callable(self, "_start_move_right"))

#START
func _start_move_left(duration):
	pressing_left = true
	
	var timer: Timer = Timer.new()
	add_child(timer)
	timer.wait_time = duration
	timer.start()
	print("moving left")
	
	await timer.timeout
	
	print("stop moving left")
	pressing_left = false
	timer.queue_free()

func _start_move_up(duration):
	pressing_jump = true
	
	var timer: Timer = Timer.new()
	add_child(timer)
	timer.wait_time = duration
	timer.start()
	print("moving up")
	
	await timer.timeout
	
	print("stop moving up")
	pressing_jump = false
	timer.queue_free()
	
func _start_move_right(duration):
	pressing_right = true
	
	var timer: Timer = Timer.new()
	add_child(timer)
	timer.wait_time = duration
	timer.start()
	print("moving right")
	
	await timer.timeout
	
	print("stop moving right")
	pressing_right = false
	timer.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	horizontal_move(delta)
	vertical_move(delta)
	
func horizontal_move(delta):
	if pressing_left:
		if velocity.x > -player_top_speed:
			velocity.x -= player_acceleration * delta
	elif pressing_right:
		if velocity.x < player_top_speed:
			velocity.x += player_acceleration * delta
	elif velocity.x != 0:
		velocity.x -= sign(velocity.x) * player_acceleration * delta
		
func vertical_move(delta):
	if !is_on_floor():
		velocity.y += gravity * delta
	elif pressing_jump:
		velocity.y -= player_jump_speed
	else:
		velocity.y = 0
		
	move_and_slide()
