extends RigidBody2D

func doDamage(weapon: Node2D)->void:
	current_hp -= weapon.damage
	if current_hp <= 0:
		# Here add explosions
		queue_free()