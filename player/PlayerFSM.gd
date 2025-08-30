extends FiniteStateMachine


func _init()-> void:
	_add_state("idle")
	_add_state("walk")
	_add_state("jump")
	_add_state("fall")

func _ready() -> void:
	set_state(states.idle)

func _state_logic(_delta: float) -> void:
	if state == states.idle or state == states.walk:
		parent.get_input()
		parent.move()

func _get_transition() -> int:
	match state:
		states.idle:
			if parent.velocity.length() > 10:
				return states.walk
		states.walk:
			if parent.velocity.length() < 10:
				return states.idle
		states.hurt:
			if not animation_player.is_playing():
				return states.idle
	return -1
	
	
func _enter_state(_previous_state: int, new_state: int) -> void:
	match new_state:
		states.idle: 
			animation_player.play("idle")
		states.walk:
			animation_player.play("walk")
		states.jump:
			animation_player.play("jump")
		states.fall:
			animation_player.play("fall")
		
