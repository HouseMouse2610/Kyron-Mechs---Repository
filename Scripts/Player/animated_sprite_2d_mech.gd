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
	elif p.current_state == p.state.LAND:
		play("Land")
		
	if p.direction != 0:
		flip_h = (p.direction < 0) 

func _on_animation_finished() -> void:
	if p.current_state == p.state.LAND:
		p.current_state = p.state.IDLE
