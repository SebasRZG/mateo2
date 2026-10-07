extends enemigo_verde
class_name mago

var disparo
var shoot
var lado

func _ready() -> void:
	sprite=$AnimatedSprite2D2
	shoot=$Marker2D
	disparo=preload("res://escena/maga_bala.tscn")

func _physics_process(delta: float) -> void:
	var objetivo = player.global_position
	direction=objetivo.x-global_position.x
	speed=quieto
	cambiar_lado()
	
func cambiar_lado():
	if direction>0:
		sprite.flip_h=false
		shoot.position.x=(abs(shoot.position.x))*-1
		lado="derecha"
		
	if direction<0:
		sprite.flip_h=true
		shoot.position.x=abs(shoot.position.x)
		lado="izquierda"

func _on_timer_timeout() -> void:
	estado="Attack"
	animacion()
	
func _on_animated_sprite_2d_2_animation_finished() -> void:
	var hechizo=disparo.instantiate()
	var ubicacion=shoot.position
	hechizo.global_position=ubicacion*-1
	hechizo.lado=lado
	add_child(hechizo)
	estado="Run"
	animacion()
