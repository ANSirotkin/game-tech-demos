extends Weapon
class_name Melee

@onready var hitbox: Area2D = $Hitbox

func _ready():
	hitbox.monitoring = false;

func attack():
	can_attack = false
	hitbox.monitoring = true;
	#sprite.play("attack")
	var attack_timer = get_tree().create_timer(attack_cooldown)
	attack_timer.timeout.connect(func(): can_attack = true; hitbox.monitoring = false)
