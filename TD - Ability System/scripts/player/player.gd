extends CharacterBody2D

#@export var ui: CanvasLayer
@export var bullet: PackedScene

@onready var gun = $Gun

var health := 50
var atk_speed := 0.3
var can_shoot := true

func _ready():
	#ui.get_child(0).max_value = health
	#ui.get_child(0).value = health
	pass

func _physics_process(delta):
	move_and_slide()
	gun_function()

func take_damage(damage: int):
	health -= damage
	#ui.get_child(0).value = health
	if health <= 0:
		kill()

func kill():
	pass

func gun_function():
	var direction = get_global_mouse_position()
	gun.look_at(direction)
	if Input.is_mouse_button_pressed(1) and can_shoot:
		var instance = bullet.instantiate()
		instance.position = Vector2(position.x + 20 * cos(gun.rotation), position.y + 20 * sin(gun.rotation))
		instance.rotation = gun.rotation
		get_parent().add_child(instance)
		can_shoot = false
		var timer = get_tree().create_timer(atk_speed)
		timer.timeout.connect(timeout_function)

func timeout_function():
	can_shoot = true
