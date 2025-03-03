extends CharacterBody2D
class_name Segment_Direct

@onready var tail_position = $Rotated/Tail_Position
@onready var sprite = $Rotated/Sprite
@onready var rotated = $Rotated
@onready var chain = $Rotated/Chain

var head : Segment_Direct = null
var tail : Segment_Direct = null

@export var speed : int = 600
var steering_strength : int = speed / 20

func _ready():
	if head != null: $Camera2D.queue_free()
	
	get_parent().snake_spawned.connect(assign_color)

func assign_color():
	if head == null: 
		sprite.modulate = Color.RED
		z_index = 1
		chain.queue_free()
	elif tail == null: 
		sprite.modulate = Color.BLUE
	else:
		sprite.modulate = Color.GHOST_WHITE

func _physics_process(delta: float):
	if head == null:
		head_movement(delta)
	else:
		tail_movement(delta)
	
	rotated.look_at(velocity + sprite.global_position)
	move_and_slide()

func head_movement(delta: float):
	var desired_position = get_global_mouse_position() - global_position
	var desired_velocity = desired_position.normalized() * speed
	var steering_force = (desired_velocity - velocity) * steering_strength
	velocity += (steering_force * delta)

func tail_movement(delta: float):
	var desired_position = head.tail_position.global_position - global_position
	var desired_velocity = desired_position.normalized() * speed
	var steering_force = (desired_velocity - velocity) * steering_strength
	velocity += (steering_force * delta)
