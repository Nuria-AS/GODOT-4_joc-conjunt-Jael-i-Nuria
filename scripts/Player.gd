extends KinematicBody2D



export(PackedScene) var projectile
export var health = 100

onready var sprite = $Sprite
onready var timer = $Timer
onready var death_timer = $DeathTimer
onready var audio = $Audio

const UP = Vector2(0, -1) #per saber on està el terra i on està cap a munt, per després poder saltar. Amunt es negatiu (-1)
var motion = Vector2()
export var speed = 200 #velocitat a la que es mou a esquerra i dreta
export var gravity = 10
export var jump_force = -400 #quan salta, es negatiu perque a munt en l'eix de y es negatiu
#si dius *export* var, la variable s'exporta i tmb surt al panel de Inspector, i es pot canviar des d'alla


var screen_size
var half_sprite_size
var can_shoot = true
var dead = false

#per moure's esquerra dreta, i satar
func _physics_process(delta):
	motion.y += gravity
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
	elif Input.is_action_pressed("ui_left"):
		motion.x = - speed #speed negativa perque vaigi a l'esquerra en l'ex de la x
	else:
		motion.x = 0 #si no hi ha res clicat el player es queda quiet
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = jump_force #no he de posar negatiu aqui perque el número de jump_force ja es negatiu
	
	motion = move_and_slide(motion, UP)



#crec que es perque no es surti de la pantalla
func _ready():
	screen_size = get_viewport_rect(). size.x
	half_sprite_size = sprite.texture.get_width() * scale.x / 2


#per disparar
	if can_shoot and Input. is_action_pressed("shoot"):
		can_shoot = false
		var new_projectile = projectile.instance()
		get_parent().add_child(new_projectile)  #1.aixo fa que els trets no segueixin la linia de la posicio del player
		new_projectile.position = position      #2.position es la posicio del player, i la new... es del projectil, aixi k el projectil surt de la nau (player)
		timer.start()
		audio.play() #every time he shoots emits a sound - audio
	
	position.x = clamp(position.x, 0 + half_sprite_size, screen_size - half_sprite_size)

func _on_Timer_timeout():
	can_shoot = true

func add_damage(damage):
	if dead:
		return
	health -= damage
	if health <= 0:
		dead = true
		health = 0
		death_timer.start()
		set_process(false)
		sprite.queue_free()


func _on_DeathTimer_timeout():
	get_tree().reload_current_scene()
	

#altre joc



