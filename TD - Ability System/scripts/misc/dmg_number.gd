extends Node2D

func _ready():
	var tween = get_tree().create_tween()
	tween.parallel().tween_property(self, "modulate", Color.TRANSPARENT, .5)
	tween.parallel().tween_property(self, "position", Vector2(position.x, position.y - 10), .5)
	tween.tween_callback(queue_free)
