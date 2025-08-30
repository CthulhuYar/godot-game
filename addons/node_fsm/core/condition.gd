@tool
# Базовый класс для всех условий переходов в FSM.
extends Resource
class_name FSMCondition

# Абстрактный метод. Должен быть переопределен в наследниках.
func is_met(actor: Node, state: Node, delta: float) -> bool:
	push_error("FSMCondition.is_met() is not overridden.")
	return false

# Сбрасывает внутреннее состояние условия (например, таймер).
# Важно вызывать при входе в состояние.
func reset() -> void:
	pass
