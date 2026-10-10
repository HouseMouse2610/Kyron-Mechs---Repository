extends Area2D

@onready var p = $".."
@onready var c = $CollisionShape2D

func attack():
	if p.direction > 0:
		rotation_degrees = 0
	elif p.direction < 0:
		rotation_degrees = 180
	
	if p.current_state == p.state.ATTACK:
		c.disabled = false
	else:
		c.disabled = true
