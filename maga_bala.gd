extends CharacterBody2D

var lado
var speed = 50
var direction
@onready var sprite = $AnimatedSprite2D
signal golpear

func _ready() -> void:
	if lado=="derecha":
		direction=1
		sprite.flip_h=true
		
	if lado=="izquierda":
		direction=-1

func _physics_process(delta: float) -> void:
	velocity.x=speed*direction
	move_and_slide()
	
	var colisiones=get_slide_collision_count()
	
	for i in colisiones:
		var choque = get_slide_collision(i)
		var objeto = choque.get_collider()
		
		if objeto is TileMapLayer || is_in_group("enemy"):
			queue_free()

func _on_golpear() -> void:
	queue_free()
