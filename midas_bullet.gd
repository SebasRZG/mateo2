extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var midas=get_node("/root/Node2D/Midas")

var direction
var speed=50

func _ready() -> void:
	direction=midas.direccion_disparo

func _physics_process(delta: float) -> void:
	
	animated_sprite_2d.flip_h=direction.x<0
	animated_sprite_2d.play("Shoot")
	velocity = speed*direction
	
	move_and_slide()
