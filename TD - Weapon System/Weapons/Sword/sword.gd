extends Melee

var dash_time = 0.1
@onready var player = get_tree().get_first_node_in_group("player")

func _init():
	attack_cooldown = .5
	active_time = 0.2
	attack_damage = 10
	alternate_cooldown = 0.5

func _physics_process(_delta: float):
	if hitbox.monitoring:
		sprite.scale = Vector2(2, 2)
	else:
		sprite.scale = Vector2.ONE

func alternate():
	can_alternate = false
	var initial_speed = player.max_speed
	var dash_timer = get_tree().create_timer(dash_time)
	player.max_speed *= 5
	dash_timer.timeout.connect(func(): 
		player.max_speed = initial_speed
		var alt_timer = get_tree().create_timer(alternate_cooldown)
		alt_timer.timeout.connect(func(): can_alternate = true))
	
