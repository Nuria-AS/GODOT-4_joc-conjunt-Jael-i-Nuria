extends Node2D

#const MOVE_SPEED = 500
#const OFFSET = 64
#
#onready var right = $rightBakcground
#onready var left = $leftBakcground
#
#
#var right_position
#var left_position
#
#func _ready():
#	#right_position = top.position.x
#	left_position = get_viewport_rect().size.x
#
#func _process(delta):
#	right.position.y += MOVE_SPEED * delta
#	left.position.y += MOVE_SPEED * delta
#	if right.position.y >= left_position + OFFSET:
#		right.position.y = right_position
#	elif left.position.y >= left_position + OFFSET:
#		left.position.y = right_position



#No em surt el looping horitzontal del background > fer parallax
#var width = 0
#
#
#func _ready():
#	#width = $leftBakcground.texture.get_width()
#	width = $leftBakcground.get_global_transform_with_canvas()
#	pass
#
#func _process(delta):
#	$leftBakcground.translate(Vector2(-500 * delta, 0))
#	$rightBakcground.translate(Vector2(-500 * delta, 0))
#	if $leftBakcground.position.x <= width:
#		$leftBakcground.position.x = width
#	if $rightBakcground.position.x <= -width:
#		$rightBakcground.position.x = width
