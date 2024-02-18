extends CharacterBody2D

var speed := 200
var lifetime := 2
var dmg := 10

func _ready():
	velocity = Vector2(speed * cos(rotation), speed * sin(rotation))

func _physics_process(delta):
	move_and_slide()
	var timer = get_tree().create_timer(lifetime)
	timer.timeout.connect(kill_yourself)

func kill_yourself():
	queue_free()

func _on_area_2d_body_entered(body):
	if body.is_in_group("damageable"):
		body.take_damage(dmg)
