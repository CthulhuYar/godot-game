@tool
class_name ActionPressedCondition
extends FSMCondition

@export var action: StringName = "ui_accept"

func is_met(actor: Node, state: Node, delta: float) -> bool:
	return Input.is_action_just_pressed(action)
