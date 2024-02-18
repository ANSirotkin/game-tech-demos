extends Node
class_name Ability

signal Cooldown

var input: String
var cooldown: float
@onready var player = get_tree().get_first_node_in_group("player")
	
func Execute():
	pass

func get_input():
	return input

func get_cooldown():
	return cooldown
	
func Physics_Update(delta: float):
	pass
