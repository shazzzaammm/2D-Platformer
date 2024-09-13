extends State
class_name PlayerIdle

var player:Player

func Enter():
	state_transition.emit()
	player = get_parent().get_parent()
	
func Update(_delta:float):
	if (Input.is_action_just_pressed("Dash") and player.can_dash 
	and Input.get_vector("Move_Left","Move_Right","Move_Up","Move_Down") != Vector2.ZERO):
		get_parent().change_state(self, "PlayerDash")
	
	if (Input.get_axis("Move_Left", "Move_Right")):
		get_parent().change_state(self, "PlayerGroundedMovement")
	
	if (Input.is_action_just_pressed("Jump")):
		get_parent().change_state(self, "PlayerJump")
	
	if (!player.is_on_floor()):
		get_parent().change_state(self, "PlayerAirMovement")
	
func Exit():
	pass
