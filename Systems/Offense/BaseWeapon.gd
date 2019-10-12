extends Node2D

export (int) var weapon_type: int
export (float) var cooldown: float
export (int) var damage: int
export (int) var damage_type: int

export (Texture) var weapon_sprite: Texture
export (Vector2) var weapon_shoot_point: Vector2
export (AudioStreamSample) var weapon_shoot_sound: AudioStreamSample

onready var WeaponSprite = Sprite.new()
onready var WeaponShootPoint = Position2D.new()
onready var WeaponShootCooldown = Timer.new()
onready var WeaponShootSound = AudioStreamPlayer2D.new()

onready var can_shoot = true

func _ready():
	_init_variables()
	_init_nodes()

func _process(delta):
	if Input.is_action_pressed("shoot") and can_shoot:
		_shoot()

func _init_variables()->void:
	pass
	
func _init_nodes()->void:
	WeaponSprite.set_texture(weapon_sprite)
	WeaponSprite.set_name("WeaponSprite")
	WeaponShootPoint.set_position(weapon_shoot_point)
	WeaponShootPoint.set_name("WeaponShootPoint")
	WeaponShootCooldown.set_wait_time(cooldown)
	WeaponShootCooldown.set_name("WeaponShootCooldown")
	WeaponShootCooldown.connect("timeout", self, "_on_weapon_shoot_cooldown_timeout")
	WeaponShootSound.set_stream(weapon_shoot_sound)
	WeaponShootSound.set_name("WeaponShootSound")
	WeaponShootSound.set_bus("Sound Effects")
	
	add_child(WeaponSprite)
	add_child(WeaponShootPoint)
	add_child(WeaponShootCooldown)
	add_child(WeaponShootSound)

func _shoot()->void:
	pass
	
func _on_weapon_shoot_cooldown_timeout()->void:
	can_shoot = true