extends CharacterBody2D
class_name Projectile

@onready var hitbox: Area2D = $Hitbox

@onready var sprite = $Sprite

var from_enemy: bool

var damage: int

var lifetime: float

var speed: int

var damaged: Array[Node2D] = []

func _ready():
	velocity = Vector2(speed * cos(rotation), speed * sin(rotation))
	hitbox.area_entered.connect(on_hit)
	on_spawn()

func _physics_process(_delta):
	move_and_slide()
	var timer = get_tree().create_timer(lifetime)
	timer.timeout.connect(kill_yourself)

func on_spawn():
	pass

func on_hit(area: Area2D):
	var entity = area.get_parent()
	if entity.is_in_group("damageable"):
		damage_entity(entity)
		
func damage_entity(entity: Node2D):
	if entity not in damaged and ((entity.is_in_group("player") and from_enemy) or (!entity.is_in_group("player") and !from_enemy)):
		entity.take_damage(damage)
		damaged.append(entity)
		kill_yourself()
		
func on_death():
	pass

func kill_yourself():
	on_death()
	queue_free()
