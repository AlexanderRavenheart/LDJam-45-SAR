extends Node2D

class_name BaseEnemy

# onready var constants = get_node("../Constants")

export (int) var enemy_type
export (int, 10, 100, 10) var max_hp: int
export (int, 10, 100, 10) var power: int
export (int, 10, 100, 10) var mobility: int

export (Texture) var sprite: Texture
export (Texture) var glow: Texture
export (Texture) var chassis: Texture
export (Texture) var body: Texture
export (Texture) var top: Texture
export (Texture) var wing_left: Texture
export (Texture) var wing_right: Texture

export (PoolVector2Array) var weapon_mounts: PoolVector2Array
export (Array, Constants.Weapons) var weapon_array: Array

var EnemySprite: Sprite
var EnemyGraphic: Node2D
var Glow: Sprite
var Chassis: Sprite
var Body: Sprite
var Top: Sprite
var WingLeft: Sprite
var WingRight: Sprite
onready var EnemyWeapons = Node2D.new()

func _ready():
	_init_variables()
	_init_nodes()
	build_ship()

func _init_variables()->void:
	pass
	
func build_ship()->void:
	$Graphic/Chassis.frame = randi() % 7
	$Graphic/Body.frame = randi() % 6
	$Graphic/Top.frame = randi() % 6
	$Graphic/WingLeft.frame = randi() % 6
	$Graphic/WingRight.frame = randi() % 6

func _init_nodes()->void:
	if (sprite):
		EnemySprite = Sprite.new()
		EnemySprite.set_name("EnemySprite")
		EnemySprite.set_texture(sprite)
		add_child(EnemySprite)
	else:
		EnemyGraphic = Node2D.new()
		EnemyGraphic.set_name("Graphic")
		
		Glow = Sprite.new()
		Glow.set_name("Glow")
		Glow.set_texture(glow)
		Chassis = Sprite.new()
		Chassis.set_name("Chassis")
		Chassis.set_texture(chassis)
		Chassis.hframes = 6
		Body = Sprite.new()
		Body.set_name("Body")
		Body.set_texture(body)
		Body.hframes = 6
		Body.position = Vector2(0.0, 7.0)
		Top = Sprite.new()
		Top.set_name("Top")
		Top.set_texture(top)
		Top.hframes = 6
		Top.position = Vector2(0.0, -19.5)
		WingLeft = Sprite.new()
		WingLeft.set_name("WingLeft")
		WingLeft.set_texture(wing_left)
		WingLeft.hframes = 6
		WingLeft.position = Vector2(-24.0, 4.0)
		WingRight = Sprite.new()
		WingRight.set_name("WingRight")
		WingRight.set_texture(wing_right)
		WingRight.hframes = 6
		WingRight.position = Vector2(24.0, 4.0)
		WingRight.scale = Vector2(-1.0, 1.0)
		
		EnemyGraphic.add_child(Glow)
		EnemyGraphic.add_child(Chassis)
		EnemyGraphic.add_child(Body)
		EnemyGraphic.add_child(Top)
		EnemyGraphic.add_child(WingLeft)
		EnemyGraphic.add_child(WingRight)
		add_child(EnemyGraphic)
	
	EnemyWeapons.set_name("EnemyWeapons")
	var weapon_counter = 0
	for weapon_id in weapon_array:
		var weapon_res = load(Constants.get_weapon_scene(weapon_id))
		var weapon = weapon_res.instance()
		weapon.position = weapon_mounts[weapon_counter]
		EnemyWeapons.add_child(weapon)
		weapon_counter += 1
	add_child(EnemyWeapons)