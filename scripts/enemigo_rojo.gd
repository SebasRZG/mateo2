extends enemigo_verde

@onready var raycast2D

func _ready() -> void:
	direction=1
	raycast2D=$RayCast2D

func _physics_process(delta: float) -> void:
	voltear_sprite($Sprite2D)
	borde(raycast2D,delta)

func borde(raycast2D,delta):
	chocar_muro(delta)
	if not raycast2D.is_colliding():
		cambio_direccion()
	
func _on_cambiodireccion() -> void:
	raycast2D.position.x*=-1
