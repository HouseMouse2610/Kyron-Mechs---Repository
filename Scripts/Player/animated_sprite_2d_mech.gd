extends AnimatedSprite2D

@onready var p = $".."

func update_sprite():
	if p.current_state == p.state.IDLE:
		play("Idle")
	elif p.current_state == p.state.WALK:
		play("Walk")
	elif p.current_state == p.state.JUMP:
		play("Jump")
	elif p.current_state == p.state.FALL:
		play("Fall")
	elif p.current_state == p.state.ATTACK:
		if p.is_on_floor():
			play("Attack")
		elif not p.is_on_floor():
			play("Air Attack")
	elif p.current_state == p.state.LAND:
		play("Land")
	elif p.current_state == p.state.DASH:
		play("Dash")
	
	if p.direction != 0:
		flip_h = (p.direction < 0) 

func _on_animation_finished() -> void:
	if p.current_state == p.state.LAND:
		p.current_state = p.state.IDLE
	elif p.current_state == p.state.ATTACK:
		p.current_state = p.state.IDLE
