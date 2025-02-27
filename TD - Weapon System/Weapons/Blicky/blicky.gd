extends Gun

func _init():
	attack_cooldown = 0.5
	max_ammo = 7
	reload_time = 2
	projectile = load("res://Weapons/Blicky/blicky_bullet.tscn")

func alternate():
	can_alternate = false
	can_attack = false
	can_reload = false
	for i in range(ammo):
		spawn_projectile(10)
		await get_tree().create_timer(0.1).timeout
	ammo = 0
	can_reload = true
	var alt_timer = get_tree().create_timer(alternate_cooldown)
	alt_timer.timeout.connect(func(): can_alternate = true)
