extends CanvasLayer

@onready var l = $Label
@export var h : Node

func atualize_label():
	l.text = "Health: " + str(h.health) + " / " + str(h.max_health)
	
