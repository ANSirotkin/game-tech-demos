extends CharacterBody2D

@export var equipped_weapon_packed: PackedScene = load("res://Weapons/Blicky/blicky.tscn")
var equipped_weapon: Weapon

var max_speed: int = 200
var input: Vector2

func _ready():
	equipped_weapon = equipped_weapon_packed.instantiate()
	add_child(equipped_weapon)
	
func _physics_process(_delta: float):
	$Sprite.flip_h = get_local_mouse_position().x < 0
	player_movement()
	move_and_slide()
	use_weapon()
	rotate_weapon()

func rotate_weapon():
	equipped_weapon.rotation = ($Sprite.global_position).angle_to_point(get_global_mouse_position())
	
func player_movement():
	input = get_input()
	
	if input == Vector2.ZERO:
		velocity = Vector2.ZERO
	else:
		velocity = input * max_speed

func get_input():
	input.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	input.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up")) 
	return input.normalized()

func use_weapon():
	if Input.is_action_pressed("attack") && equipped_weapon.can_attack && !equipped_weapon.reloading:
		equipped_weapon.attack()
	elif Input.is_action_pressed("alternate") && equipped_weapon.can_alternate && !equipped_weapon.reloading:
		equipped_weapon.alternate()
	elif Input.is_action_just_pressed("reload") && equipped_weapon.can_reload && !equipped_weapon.reloading:
		equipped_weapon.reload()
