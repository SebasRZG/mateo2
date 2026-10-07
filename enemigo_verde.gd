extends enemy
class_name enemigo_verde

@onready var player=get_node("/root/Node2D/Midas")
var sprite
var estado
signal golpear
var direccion
var objetivo

func _ready() -> void:
	sprite=$AnimatedSprite2D
	direction=1
	speed=SPEED

func _physics_process(delta: float) -> void:
	voltear_sprite(sprite)
	chocar_muro(delta)

func chocar_muro(delta):
	move(delta)
	if is_on_wall():
		cambio_direccion()

func voltear_sprite(sprite):
	sprite.flip_h=direction<0

func _on_animated_sprite_2d_animation_finished() -> void:
	direction*=-1
	speed=SPEED
	estado="Run"
	animacion()
	
func animacion():
	sprite.play(estado)

func _on_golpear() -> void:
	objetivo=player.global_position
	direccion=(objetivo-global_position).normalized()
	if direccion.x<0:
		direction=-1
		
	if direccion.x>0:
		direction=1
	speed=quieto
	estado="Attack"
	animacion()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		direction*=-1
