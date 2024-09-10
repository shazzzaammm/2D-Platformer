extends State
class_name PlayerGroundedMovement

var player:Player

func Enter():
	player = get_parent().get_parent()
	player.velocity.y = 0

func Update(_delta:float):
	if (Input.is_action_just_pressed("Dash")):
		get_parent().change_state(self, "PlayerDash")

	if Input.is_action_just_pressed("Jump") or player.jump_queued:
		get_parent().change_state(self, "PlayerJump")
	
	if (!player.is_on_floor()):
		get_parent().change_state(self, "PlayerAirMovement")
		
	var movement_direction = Input.get_axis("Move_Left","Move_Right")
	player.velocity.x = player.grounded_movement_speed * movement_direction

	#if (player.velocity == Vector2.ZERO):
		#get_parent().change_state(self, "PlayerIdle")

func Exit():
	pass
