extends CharacterBody2D

var speed := 300
var lifetime := 2

func _ready():
	velocity = Vector2(speed * cos(rotation), speed * sin(rotation))

func _physics_process(delta):
	move_and_slide()
	var timer = get_tree().create_timer(lifetime)
	timer.timeout.connect(kill_yourself)

func kill_yourself():
	queue_free()
