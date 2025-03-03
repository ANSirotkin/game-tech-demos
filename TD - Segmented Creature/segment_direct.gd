extends CharacterBody2D
class_name Segment_Direct

@onready var tail_position = $Rotated/Tail_Position
@onready var sprite = $Rotated/Sprite
@onready var rotated = $Rotated
@onready var chain = $Rotated/Chain

var head : Segment_Direct = null
var tail : Segment_Direct = null
@export var speed : int = 1000
var steering_strength : int = speed / 20

func _ready():
	if head != null: 
		$Camera2D.queue_free()
		if head.sprite.modulate.r >= 1 or head.sprite.modulate.g >= 1 or head.sprite.modulate.b >= 1:
			sprite.modulate = Color.BLACK
		else:
			sprite.modulate = head.sprite.modulate + Color(.1, 0, .1)
	else:
		sprite.modulate = Color(0, 0, 0)
	get_parent().snake_spawned.connect(snake_spawned)

func snake_spawned():
	if head == null: 
		z_index = 1
		chain.queue_free()
	#if tail != null:
		#$Camera2D.queue_free()

func _physics_process(delta: float):
	if head == null:
		head_movement(delta)
	else:
		tail_movement(delta)
		
	if Input.is_action_just_pressed("increase"):
		speed += 100
		
	elif Input.is_action_just_pressed("decrease"):
		speed -= 100
	
	if !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		move_and_slide()
		rotated.look_at(velocity + sprite.global_position)


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
