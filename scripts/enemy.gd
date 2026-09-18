extends CharacterBody2D
class_name enemy

signal cambiodireccion
const SPEED = 100.0
var direction
	
func move(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	velocity.x = direction * SPEED

	move_and_slide()
	
func cambio_direccion():
	direction*=-1
	cambiodireccion.emit()
