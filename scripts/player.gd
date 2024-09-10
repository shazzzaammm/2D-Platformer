extends CharacterBody2D
class_name Player
@export_group("Ground")
@export var grounded_movement_speed:float

@onready var ground_check_ray:RayCast2D = $GroundCheck

@export_group("Air")
@export var air_movement_speed:float
@export var max_fall_speed:float
@export var coyote_time:float

@export_group("Jump")
@export var jump_height:float
@export var jump_rising_time:float
@export var jump_falling_time:float

var jump_queued:bool= false

@onready var jump_power:float = (2.0 * jump_height) / jump_rising_time
@onready var jump_gravity:float = (-2.0 * jump_height) / (jump_rising_time * jump_rising_time)
@onready var fall_gravity:float = (-2.0 * jump_height) / (jump_falling_time * jump_falling_time)

@export_group("Dash")
@export var dash_distance:float
@export var dash_time:float

@onready var dash_speed = dash_distance / dash_time

func _physics_process(_delta):
	move_and_slide()

