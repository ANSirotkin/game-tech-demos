extends Node2D

signal snake_spawned

var segment_dict = {
	0: load("res://segment_direct.tscn"),
}

@export var snake_length = 2

@export var movement_mode = 0

func _ready():
	var prev_segment = null
	for i in range(snake_length):
		var instance = segment_dict[movement_mode].instantiate()
		if prev_segment == null:
			add_child(instance)
			prev_segment = instance
			continue
		instance.head = prev_segment
		prev_segment.tail = instance
		prev_segment = instance
		add_child(instance)
	snake_spawned.emit()
