extends Node

@export var ability: Ability

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		body.get_child(3).unlock_ability(ability.duplicate())
		queue_free()
