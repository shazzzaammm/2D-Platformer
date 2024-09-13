extends State
class_name  PlayerAirMovement

var player:Player

func Enter():
	state_transition.emit()
	player = get_parent().get_parent()
	
func Update(_delta:float):
	if (Input.is_action_just_pressed("Dash") and player.can_dash 
	and Input.get_vector("Move_Left","Move_Right","Move_Up","Move_Down") != Vector2.ZERO):
		get_parent().change_state(self, "PlayerDash")
	
	if player.is_on_floor():
		get_parent().change_state(self, "PlayerGroundedMovement")
	
	if Input.is_action_just_pressed("Jump"):
		if player.ground_check_ray.is_colliding():
			player.jump_queued = true
		elif player.coyote_ready:
			get_parent().change_state(self, "PlayerJump")
		elif player.is_on_wall():
			get_parent().change_state(self, "PlayerWallJump")
	
	player.velocity.y -= player.fall_gravity * _delta
	
	if player.velocity.y > player.max_fall_speed:
		player.velocity.y = player.max_fall_speed
	
	var movement_direction = Input.get_axis("Move_Left","Move_Right")
	if movement_direction == 0:
		player.velocity.x = lerpf(player.velocity.x,0.0,0.1)
	else:
		player.velocity.x = lerpf(player.velocity.x, player.grounded_movement_speed * movement_direction, player.air_acceleration_percentage)
	
func Exit():
	pass
