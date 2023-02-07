extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var move_speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Hello world.")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var offset = Vector2(0,0)
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
		
	if Input.is_action_pressed("move_left"):
		offset.x = -1
	if Input.is_action_pressed("move_right"):
		offset.x = 1
	if Input.is_action_pressed("move_up"):
		offset.y = -1
	if Input.is_action_pressed("move_down"):
		offset.y = 1
		
	offset = offset.normalized() # Fix diagnal movement
	
	# Set the vector length
	offset = offset * move_speed
	
	move_and_slide(offset)
