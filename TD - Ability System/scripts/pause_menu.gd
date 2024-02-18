extends Control

@export var ringmaster: Node2D

func _ready():
	hide()
	ringmaster.connect("toggle_game_paused", on_toggle)

func on_toggle(is_paused: bool):
	if is_paused:
		show()
	else:
		hide()


func _on_restart_pressed():
	ringmaster.game_paused = false
	get_tree().reload_current_scene()


func _on_quit_pressed():
	get_tree().quit()
