@tool
class_name State
extends Node

signal transitioned(state: State, new_state_name: String)

@export var transitions: Array[FSMTransition] = []

var machine: Node = null
var actor: Node = null

func _ready() -> void:
	if Engine.is_editor_hint():
		set_process(false)
		set_physics_process(false)

func enter() -> void: print("Enter")
func exit() -> void: pass
func update(delta: float) -> void: pass
func physics_update(delta: float) -> void: pass

func transition_to(new_state_name: String) -> void:
	emit_signal("transitioned", self, new_state_name)

func _reset_conditions() -> void:
	for t in transitions:
		if t and t.condition:
			t.condition.reset()
