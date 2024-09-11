extends Node
class_name FiniteStateMachine

var states:Dictionary = {}
@export var initial_state:State
var current_state:State
func _ready():
	for state in get_children():
		if state is State:
			states[state.name.to_lower()] = state
			
	current_state = initial_state
	current_state.Enter()

func _physics_process(delta):
	current_state.Update(delta)

func change_state(source_state, desired_state_name):
	if current_state != source_state:
		printerr("Error! Trying to change from " + source_state.name + " while in " + current_state.name)	
		return
	
	var desired_state = states[desired_state_name.to_lower()]
	if !desired_state:
		printerr("Error! State \""+ desired_state_name + "\" does not exist ")
		return
	current_state.Exit()
	current_state = desired_state
	current_state.Enter()
	
	#print("Success! Changed from " + source_state.name + " to " + desired_state_name)
