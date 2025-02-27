extends Node2D
class_name Weapon

@onready var sprite = $Sprite
@onready var spriteypos = sprite.position.y
@onready var player_owner: bool = true if get_parent().is_in_group("player") else false

var attack_cooldown: float
var alternate_cooldown: float

var can_attack: bool = true
var can_alternate: bool = true
var can_reload: bool = true

var reloading: bool = false

func _process(_delta: float):
	if rotation_degrees > 90 || rotation_degrees < -90:
		sprite.position.y = -spriteypos
		sprite.flip_v = true
	else:
		sprite.position.y = spriteypos
		sprite.flip_v = false
	
	sprite.z_index = -1 if (rotation_degrees < -20 && rotation_degrees > -160) else 1

func attack():
	pass

func alternate():
	pass

func reload():
	pass
