extends Node2D

@onready var screen_size := get_viewport().get_visible_rect().size

var mouse_position := Vector2.ZERO
var coordinates := Vector2i(1, 9)

func to_position(coordinate):
	return (screen_size / 2 - Vector2(160, 288)) + Vector2(coordinate) * 64

func _ready():
	screen_size = get_viewport().get_visible_rect().size
	position = Vector2(screen_size.x / 2 - 96, screen_size.y)
	$Arm.points[0] = to_position(Vector2i(1, 9)) - position
	$Sock.position = $Arm.points[0]

func _process(delta):
	if OS.is_debug_build(): # dynamically move for testing
		screen_size = get_viewport().get_visible_rect().size
		position = Vector2(screen_size.x / 2 - 96, screen_size.y)
	$Sock.position = $Arm.points[0]
	mouse_position = get_local_mouse_position()

func _input(event):
	if(event.is_action_pressed("move_up")):
		coordinates.y -= 1
		$Arm.add_point(to_position(coordinates) - position, 0)
		$Sock.rotation = 0
	if(event.is_action_pressed("move_down")):
		coordinates.y += 1
		$Arm.add_point(to_position(coordinates) - position, 0)
		$Sock.rotation = PI
	if(event.is_action_pressed("move_left")):
		coordinates.x -= 1
		$Arm.add_point(to_position(coordinates) - position, 0)
		$Sock.rotation = PI / -2
	if(event.is_action_pressed("move_right")):
		coordinates.x += 1
		$Arm.add_point(to_position(coordinates) - position, 0)
		$Sock.rotation = PI / 2
