extends State
class_name PlayerJump
var player:Player

func Enter():
	state_transition.emit()
	player = get_parent().get_parent()
	player.velocity.y = -player.jump_power
	player.jump_queued = false
	player.coyote_ready = false

func Exit():
	pass

func Update(_delta:float):
	if (Input.is_action_just_pressed("Dash") and player.can_dash 
	and Input.get_vector("Move_Left","Move_Right","Move_Up","Move_Down") != Vector2.ZERO):
		get_parent().change_state(self, "PlayerDash")
	if !Input.is_action_pressed("Jump"):
		get_parent().change_state(self, "PlayerAirMovement")
	if player.is_on_floor():
		get_parent().change_state(self, "PlayerGroundedMovement")
	var movement_direction = Input.get_axis("Move_Left","Move_Right")
	if movement_direction == 0:
		player.velocity.x = lerpf(player.velocity.x,0.0,0.1)
	else:
		player.velocity.x = player.air_movement_speed * movement_direction
	player.velocity.y -= player.jump_gravity * _delta

