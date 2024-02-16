extends State
class_name Player_Move

@export var player: CharacterBody2D

const max_speed = 150
const accel = 10000

var input = Vector2.ZERO

func Physics_Update(delta):
	player_movement(delta)
	
func get_input():
	input.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	input.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up")) 
	return input.normalized()
	
func player_movement(delta):
	input = get_input()
	
	if input == Vector2.ZERO:
		player.velocity = Vector2.ZERO
		Transition.emit(self, "player_idle")
	else:
		player.velocity += input * accel * delta
		player.velocity = player.velocity.limit_length(max_speed)
