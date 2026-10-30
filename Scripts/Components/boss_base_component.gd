extends Node

enum state{REST, SCREAM, BATTLE, DEAD}

@export var p = null

func _ready() -> void:
	p = get_tree().get_first_node_in_group("player")
