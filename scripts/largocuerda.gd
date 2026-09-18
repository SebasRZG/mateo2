extends CharacterBody2D

@onready var gancho=get_node("/root/Node2D/cuerda")
@onready var player=get_node("/root/Node2D/Player")
var min=10
var direccion

func _ready() -> void:
	direccion=gancho.direccion
	
func _process(delta: float) -> void:
	rotation=direccion.angle()
	
	var distance=player.global_position.distance_to($Marker2D.global_position)
	
	if distance<min:
		queue_free()
