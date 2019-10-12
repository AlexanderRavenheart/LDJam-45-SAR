extends Node2D

class_name BaseWeapon

export (int) var weapon_type: int
export (int) var weapon_level: int
export (float) var cooldown: float
var damage: int
export (int) var base_damage: int
export (Constants.DamageType) var damage_type

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

func _unhandled_input(event):
	if event.is_action_pressed("shoot") and can_shoot:
		_start_shooting()
	if event.is_action_released("shoot"):
		_stop_shooting()

func _init_variables()->void:
	can_shoot = true
	damage = base_damage * weapon_level
	
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

func _start_shooting()->void:
	_shoot()
	$WeaponShootCooldown.start()

func _stop_shooting()->void:
	$WeaponShootCooldown.stop()
	
func _on_weapon_shoot_cooldown_timeout()->void:
	_shoot()