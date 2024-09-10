extends State
class_name  PlayerAirMovement
var player:Player
func Enter():
	player = get_parent().get_parent()
	
func Update(_delta:float):
	if (Input.is_action_just_pressed("Dash")):
		get_parent().change_state(self, "PlayerDash")
	
	if player.is_on_floor():
		get_parent().change_state(self, "PlayerGroundedMovement")
	
	if Input.is_action_just_pressed("Jump") and player.ground_check_ray.is_colliding():
		player.jump_queued = true
	
	player.velocity.y -= player.fall_gravity * _delta
	
	if player.velocity.y > player.max_fall_speed:
		player.velocity.y = player.max_fall_speed
	
	var movement_direction = Input.get_axis("Move_Left","Move_Right")
	player.velocity.x = player.air_movement_speed * movement_direction
	
func Exit():
	pass
