extends CanvasLayer

@onready var p = $"../Player Mech"
@onready var l = $Label

func _physics_process(_delta: float) -> void:
	if p.current_state == p.state.HURT:
		l.text = "Health:" + str(p.health)
