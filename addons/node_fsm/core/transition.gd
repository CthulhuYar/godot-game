@tool
extends Resource
class_name FSMTransition

@export var target: NodePath = NodePath("")
@export var condition: FSMCondition

func is_ready() -> bool:
	return target != NodePath("") and condition != null
