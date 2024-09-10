extends State
class_name PlayerJump
var player:Player

func Enter():
	player = get_parent().get_parent()
	player.velocity.y = -player.jump_power
	player.jump_queued = false

func Exit():
	pass

func Update(_delta:float):
	if (Input.is_action_just_pressed("Dash")):
		get_parent().change_state(self, "PlayerDash")
	if !Input.is_action_pressed("Jump"):
		get_parent().change_state(self, "PlayerAirMovement")
	if player.is_on_floor():
		get_parent().change_state(self, "PlayerGroundedMovement")
	var movement_direction = Input.get_axis("Move_Left","Move_Right")
	player.velocity.x = player.air_movement_speed * movement_direction
	player.velocity.y -= player.jump_gravity * _delta

