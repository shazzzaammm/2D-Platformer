extends State
class_name PlayerGroundedMovement

var player:Player

func Enter():
	state_transition.emit()
	player = get_parent().get_parent()
	player.velocity.y = 0

func Update(_delta:float):
	if (Input.is_action_just_pressed("Dash") and player.can_dash 
	and Input.get_vector("Move_Left","Move_Right","Move_Up","Move_Down") != Vector2.ZERO):
		get_parent().change_state(self, "PlayerDash")

	if Input.is_action_just_pressed("Jump") or player.jump_queued:
		get_parent().change_state(self, "PlayerJump")
	
	if (!player.is_on_floor()):
		get_parent().change_state(self, "PlayerAirMovement")
		
	var movement_direction = Input.get_axis("Move_Left","Move_Right")
	if movement_direction == 0:
		player.velocity.x = lerpf(player.velocity.x,0.0,.2)
	else:
		player.velocity.x = player.grounded_movement_speed * movement_direction
	
func Exit():
	player.coyote_ready = true
	player.coyote_timer.start()
