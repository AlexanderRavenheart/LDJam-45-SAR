extends KinematicBody2D

export (int) var HP: int = 100
export (int) var POWER: int = 50
export (float) var SPEED: float = 1.0
export (float) var FRICTION: float = 0.05

var rotation_speed = 1.2
var move_speed = 200

var acceleration_velocity = Vector2()
var velocity = Vector2()
var rotation_dir = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_input():
	rotation_dir = 0
	velocity = Vector2()
	if Input.is_action_pressed('rotate_right'):
		rotation_dir += 1
	if Input.is_action_pressed('rotate_left'):
		rotation_dir -= 1
	if Input.is_action_pressed('brake'):
		acceleration_velocity = Vector2(-move_speed, 0).rotated(rotation)
	if Input.is_action_pressed('accelerate'):
		acceleration_velocity = Vector2(move_speed, 0).rotated(rotation)
		
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	

func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	velocity += acceleration_velocity
	velocity *= FRICTION
	velocity = move_and_slide(velocity)




