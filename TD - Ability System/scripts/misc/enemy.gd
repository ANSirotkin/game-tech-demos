extends CharacterBody2D

@export var health_bar: ProgressBar
@export var dmg_number: PackedScene
var health := 20

func _ready():
	health_bar.max_value = health
	health_bar.value = health

func _physics_process(delta):
	pass

func take_damage(dmg: int):
	health -= dmg
	health_bar.value = health
	spawn_number(dmg)
	if health <= 0:
		die()

func spawn_number(dmg: int):
	var instance = dmg_number.instantiate()
	instance.get_child(0).text = str(dmg)
	if health <= 0:
		instance.modulate = Color.RED
	instance.position = Vector2(position.x + randi_range(-5, 5), position.y - 15)
	get_parent().add_child(instance)
	
func die():
	queue_free()
