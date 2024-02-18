extends Ability

@export var bullet: PackedScene

func _init():
	input = "shoot"
	cooldown = 0.2

func Execute():
	var instance = bullet.instantiate()
	instance.position = Vector2(player.position.x + 20 * cos(player.get_child(5).rotation), player.position.y + 20 * sin(player.get_child(5).rotation))
	instance.rotation = player.get_child(5).rotation
	add_child(instance)
	Cooldown.emit(self)
