extends Melee

func _init():
	attack_cooldown = .5
	active_time = 0.2
	attack_damage = 10

func _physics_process(_delta: float):
	if hitbox.monitoring:
		sprite.scale = Vector2(2, 2)
	else:
		sprite.scale = Vector2.ONE
