extends StaticBody2D

var health = 100

func damage(dmg: int):
	health -= dmg
	print(health)
	if health <= 0:
		queue_free()
