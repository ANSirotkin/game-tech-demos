extends Node

@export var ui: CanvasLayer

var current_abil: Ability
var abilities: Dictionary = {}
var cooldowns: Dictionary = {}

func _ready():
	update_abilities()

func update_abilities():
	for child in get_children():
		if child is Ability and child.get_input() not in abilities.keys():
			abilities[child.get_input()] = child
			cooldowns[child.get_input()] = 0
			child.Cooldown.connect(on_finish)

func unlock_ability(ability: Ability):
	add_child(ability)
	update_abilities()

func on_finish(ability):
	cooldowns[ability.get_input()] = ability.get_cooldown()
	
func _physics_process(delta):
	lower_cooldowns(delta)
	update_ui()
	check_buttons()

func lower_cooldowns(delta):
	for ability in cooldowns:
		if cooldowns[ability] > 0:
			cooldowns[ability] -= delta

func update_ui():
	for child in ui.get_children():
		if child.name in abilities.keys():
			child.value = cooldowns[child.name] * (100 / abilities[child.name].get_cooldown())
			if cooldowns[child.name] <= 0:
				var style = StyleBoxFlat.new()
				style.set_bg_color(Color.WEB_GREEN)
				child.set('theme_override_styles/background', style)
			else:
				var style = StyleBoxFlat.new()
				style.set_bg_color(Color.SEA_GREEN)
				child.set('theme_override_styles/background', style)

func check_buttons():
	if len(abilities.keys()) != 0:
		for key in abilities.keys():
			if Input.is_action_pressed(key) and cooldowns[key] <= 0:
				abilities[key].Execute()
