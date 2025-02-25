extends Node2D
class_name Weapon

@onready var sprite = $Sprite
@onready var spriteypos = sprite.position.y

var max_ammo: int
@onready var ammo: int = max_ammo

var attack_cooldown: float
var alternate_cooldown: float

var can_attack: bool
var can_alternate: bool

var reload_time: float

func _process(_delta: float):
	if rotation_degrees > 90 || rotation_degrees < -90:
		sprite.position.y = -spriteypos
		sprite.flip_v = true
	else:
		sprite.position.y = spriteypos
		sprite.flip_v = false
	
	sprite.z_index = -1 if (rotation_degrees < -30 && rotation_degrees > -150) else 1

func attack():
	pass

func alternate():
	pass

func reload():
	pass
