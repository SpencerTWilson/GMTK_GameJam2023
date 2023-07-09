extends Node2D

func _input(event):
				#DRAG
	if event.is_action_pressed("mouse_select"):
		#Grab the current children
		#We loop backwards using blocks[-index - 1]
		#because we want to grab the top most block
		var blocks = get_children()
		for index in blocks.size():
			var block = blocks[-index - 1]
			if !(block is AudioStreamPlayer2D):
				
				#If we clicked on the block drag it with the mouse
				if block.get_rect().has_point(block.to_local(get_global_mouse_position())) and block.can_be_dragged:
					$AudioStreamPlayer2D.play()
					block.is_being_dragged = true
					block.dragging_diff = block.to_local(get_global_mouse_position()) * block.scale.x
					block.picked_up()
					move_child(block, -1) #The back of the list of children will apear visually ontop.
					break #don't pick up more cards
	
				#RELEASE
	elif event.is_action_released("mouse_select"):
		var blocks = get_children()
		for block in blocks:
			if !(block is AudioStreamPlayer2D):
				#stop dragging the block that is being dragged
				if block.is_being_dragged == true:
					block.is_being_dragged = false
					block.dropped()
					break
	
				#ACTIVATE
	elif event.is_action_pressed("mouse_activate"):
		#Grab the current children
		#We loop backwards using cards[-index - 1]
		#because we want to grab the top most card
		var blocks = get_children()
		for index in blocks.size():
			var block = blocks[-index - 1]
			if !(block is AudioStreamPlayer2D):
				#If we right clicked on the card activate it
				if block.get_rect().has_point(block.to_local(get_global_mouse_position())):
					block.activate()
					break
