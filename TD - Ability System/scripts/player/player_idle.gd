extends State
class_name Player_Idle

@export var player: CharacterBody2D

var input = Vector2.ZERO

func Physics_Update(delta):
	if get_input() != Vector2.ZERO:
		Transition.emit(self, "player_move") 

func get_input():
	input.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	input.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up")) 
	return input.normalized()
