extends Area2D

class_name BaseBullet

export (float) var life = 0.3
export (int) var move_speed = 700
export (float) var friction_factor
export (Texture) var sprite
export (Shape2D) var collision_shape

var weapon
var move_direction = Vector2(0, -1)

onready var BulletSprite = Sprite.new()
onready var BulletCollision = CollisionShape2D.new()
onready var BulletTimer = Timer.new()

func _ready()->void:
	_init_variables()
	_init_nodes()

func _init_variables():
	move_direction = Vector2(0, -1).rotated(rotation)
	
func _init_nodes():
	BulletSprite.set_texture(sprite)
	BulletCollision.set_shape(collision_shape)
	BulletTimer.autostart = true
	BulletTimer.one_shot = true
	BulletTimer.wait_time = life
	BulletTimer.connect("timeout", self, "_on_timer_timeout")
	
	add_child(BulletSprite)
	add_child(BulletCollision)
	add_child(BulletTimer)
	self.connect("body_entered", self, "_on_body_entered")

func _physics_process(delta):
	# apply motion
	move_direction = Vector2(0, -1).rotated(rotation)
	if friction_factor:
		move_speed = move_speed + (0 - move_speed) * friction_factor
	position += move_direction * move_speed * delta

func _on_timer_timeout()->void:
	self.queue_free()

func _on_body_entered(body):
	if weapon and weapon.get_parent():
		if body != weapon.get_parent():
			print("Do DAMAGE")
			body.get_node("TakesDamage").doDamage(weapon)
			queue_free()
