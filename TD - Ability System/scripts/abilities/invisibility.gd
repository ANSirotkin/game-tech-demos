extends Ability

var duration = 5
var ogcol: Color

func _init():
	input = "ability3"
	cooldown = 10

func Execute():
	ogcol = player.modulate
	player.modulate = Color(255, 255, 255, 0.3)
	var timer = get_tree().create_timer(duration)
	timer.timeout.connect(stop_invis)
	Cooldown.emit(self)

func stop_invis():
	player.modulate = ogcol
