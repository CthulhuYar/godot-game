extends CharacterBody2D
class_name Player

const SPEED = 100.0
const JUMP_VELOCITY = -300.0
const GRAVITY = 800.0
const FRICTION = 0.5

var mov_direction: Vector2 = Vector2.ZERO
var acceleration: float = 50.0
var max_speed: float = SPEED
var is_jumping: bool = false
var move_direction : float = 0.0

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	get_input()
	
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	
	move_and_slide()
	update_animation()

func move() -> void:
	if move_direction != 0.:
		velocity.x = move_direction * SPEED
	else:
		velocity.x = lerp(velocity.x, 0.0, FRICTION)
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		is_jumping = true
		velocity.y = JUMP_VELOCITY
	else:
		is_jumping = false
	
func get_input() -> void:
	move_direction = Input.get_axis("ui_left", "ui_right")

func update_animation():
	if velocity.x != 0:
		anim.flip_h = velocity.x < 0
