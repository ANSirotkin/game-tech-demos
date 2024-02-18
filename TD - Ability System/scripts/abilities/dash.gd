extends Ability

var dash_time := .15
var initial_player_vel: Vector2

func _init():
	cooldown = 3
	input = "ability1"

func Execute():
	if player.velocity == Vector2.ZERO:
		return
	player.get_child(2).process_mode = Node.PROCESS_MODE_DISABLED
	player.velocity *= 5
	Cooldown.emit(self)
	var timer = get_tree().create_timer(dash_time)
	timer.timeout.connect(stop_dash)

func stop_dash():
	player.get_child(2).process_mode = Node.PROCESS_MODE_INHERIT
