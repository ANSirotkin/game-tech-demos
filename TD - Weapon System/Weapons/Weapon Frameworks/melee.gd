extends Weapon
class_name Melee

@onready var hitbox: Area2D = $Hitbox

var active_time: float
var attack_damage: int

var damaged: Array[Node2D] = []

func _ready():
	hitbox.monitoring = false;
	hitbox.area_entered.connect(damage_attack)

func attack():
	can_attack = false
	hitbox.monitoring = true;
	#sprite.play("attack")
	var attack_timer = get_tree().create_timer(attack_cooldown)
	var active_timer = get_tree().create_timer(active_time)
	attack_timer.timeout.connect(func(): can_attack = true)
	active_timer.timeout.connect(func(): hitbox.monitoring = false; damaged.clear())

func damage_attack(area: Area2D):
	var entity = area.get_parent()
	if player_owner && entity.is_in_group("enemy") && entity not in damaged:
		entity.damage(attack_damage)
		damaged.append(entity)
	elif !player_owner && entity.is_in_group("player") && entity not in damaged:
		entity.damage(attack_damage)
		damaged.append(entity)
