extends Ability

@export var mega_bullet: PackedScene

func _init():
	input = "ability2"
	cooldown = 5
	
func Execute():
	var instance = mega_bullet.instantiate()
	instance.position = Vector2(player.position.x + 20 * cos(player.get_child(5).rotation), player.position.y + 20 * sin(player.get_child(5).rotation))
	instance.rotation = player.get_child(5).rotation
	add_child(instance)
	Cooldown.emit(self)
