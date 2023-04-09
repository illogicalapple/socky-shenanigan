extends Node

@onready var screen_size = get_viewport().get_visible_rect().size

# dimensions of tilemap are 6 by 10

func _ready():
	$TileMap.position = screen_size / 2
	$Background.position = screen_size / 2

func _process(_delta):
	if OS.is_debug_build(): # dynamically move for testing
		screen_size = get_viewport().get_visible_rect().size
		$TileMap.position = screen_size / 2
		$Background.position = screen_size / 2
