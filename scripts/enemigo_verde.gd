extends enemy
class_name enemigo_verde

func _ready() -> void:
	direction=1

func _physics_process(delta: float) -> void:
	voltear_sprite($Sprite2D)
	chocar_muro(delta)

func chocar_muro(delta):
	move(delta)
	if is_on_wall():
		cambio_direccion()

func voltear_sprite(sprite):
	sprite.flip_h=direction<0
