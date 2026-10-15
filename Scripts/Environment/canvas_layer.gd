extends CanvasLayer

@onready var p = $"../Player Mech"
@onready var l = $Label

func _physics_process(_delta: float) -> void:
	l.text = "Health:" + str(p.health)
