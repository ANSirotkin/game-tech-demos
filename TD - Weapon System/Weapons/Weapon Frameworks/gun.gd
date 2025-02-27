extends Weapon
class_name Gun

var max_ammo: int
@onready var ammo: int = max_ammo

var reload_time: float

var projectile: PackedScene

@onready var projectile_spawn_point = $Projectile_Spawn

func attack():
	can_attack = false
	can_reload = false
	ammo -= 1
	spawn_projectile(0)
	var attack_timer = get_tree().create_timer(attack_cooldown)
	attack_timer.timeout.connect(func(): 
		if ammo > 0: 
			can_attack = true; 
		can_reload = true)

func spawn_projectile(spread: float):
	var instance = projectile.instantiate()
	if !player_owner:
		instance.from_enemy = true
	instance.rotation_degrees = rotation_degrees + randf_range(-spread, spread)
	instance.global_position = projectile_spawn_point.global_position
	get_parent().get_parent().add_child(instance)

func reload():
	can_attack = false
	can_alternate = false
	can_reload = false
	reloading = true
	sprite.scale = Vector2(2, 2)
	var reload_timer = get_tree().create_timer(reload_time)
	reload_timer.timeout.connect(func(): can_attack = true; can_reload = true; sprite.scale = Vector2.ONE; can_alternate = true; reloading = false; ammo = max_ammo)
