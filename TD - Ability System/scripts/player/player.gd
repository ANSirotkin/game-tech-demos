extends CharacterBody2D

@export var ui: CanvasLayer
@export var bullet: PackedScene

@onready var gun = $Gun

var health := 50

func _ready():
	ui.get_child(0).max_value = health
	ui.get_child(0).value = health

func _physics_process(delta):
	move_and_slide()
	gun_function()

func activate_ability(ability: String):
	print(ability)

func take_damage(damage: int):
	health -= damage
	ui.get_child(0).value = health
	if health <= 0:
		kill()

func kill():
	pass

func gun_function():
	var direction = get_global_mouse_position()
	gun.look_at(direction)
