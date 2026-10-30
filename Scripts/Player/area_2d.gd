extends Area2D

@onready var p = $".."
@onready var hit = $HitBox

func attack():
	if p.direction > 0:
		rotation_degrees = 0
	elif p.direction < 0:
		rotation_degrees = 180
	
	if p.current_state == p.state.ATTACK:
		hit.disabled = false
	else:
		hit.disabled = true
