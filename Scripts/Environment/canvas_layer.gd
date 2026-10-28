extends CanvasLayer

@onready var l = $Label
@onready var h = $Health # essa linha aqui não funciona

func atualize_label():
	l.text = str(h.health) + str(h.max_health)
	
