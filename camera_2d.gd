extends Camera2D

@onready var player: CharacterBody2D = $"../Player"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if player == null:
		return
	global_position = player.global_position
