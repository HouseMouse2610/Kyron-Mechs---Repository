class_name Component
extends Node

@export var health : int = clamp(max_health, 0, max_health)
@export var max_health : int = 10

signal dead(is_dead : bool)

func hurt():
	health -= 1
	if health <= 0:
		dead.emit(true)
	
