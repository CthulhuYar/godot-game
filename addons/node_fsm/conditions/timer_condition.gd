@tool
extends FSMCondition
class_name TimerCondition

@export var duration: float = 0.2
var _t: float = 0.0

func is_met(actor: Node, state: Node, delta: float) -> bool:
	_t += delta
	return _t >= duration

func reset() -> void:
	_t = 0.0
