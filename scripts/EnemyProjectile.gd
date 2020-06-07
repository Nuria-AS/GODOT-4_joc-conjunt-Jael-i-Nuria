extends Area2D

export var speed_x = 250   #velocitat en que cau el projectil
export var damage = 10   #damage que proboca al player

func _ready():
	connect("body_entered", self, "_on_area_entered")
	
func _process(delta):
	position.x -= speed_x * delta
	if position.x > 2000:
		queue_free()





func _on_area_entered(area):
	if area.name == "Player":
		area.add_damage(damage)
		queue_free()
