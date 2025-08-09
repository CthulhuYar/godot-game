extends CharacterBody2D

@export var FRICTION: float = 0.15
@export var GRAVITY: float = 500
@export var JUMP_IMPULSE: float = 150
#@export var ACCELERATION: float = 40
@export var MAX_SPEED: float = 100

var mov_direction: Vector2 = Vector2.ZERO
var target_velocity: Vector2 = Vector2.ZERO

func _physics_process(_delta: float) -> void:
	velocity.y += GRAVITY * _delta
	var direction_x = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction_x * MAX_SPEED

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -JUMP_IMPULSE
	move_and_slide()

func get_input() -> void:
	pass
