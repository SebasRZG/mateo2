extends CharacterBody2D

@onready var largo = preload("res://escena/largocuerda.tscn")
@onready var player = get_node("/root/Node2D/Midas")

@onready var sprite=$Sprite2D
@onready var ubicacion=$Marker2D2

var speed=2
var objetivo
var min=13.00
var alargar=true
var direccion

func _ready() -> void:
	objetivo=player.enganche
	direccion=objetivo.global_position-player.global_position
	rotation=direccion.angle()
	
func _physics_process(delta: float) -> void:
	velocity=speed*direccion
	move_and_slide()
	
	if alargar:
		var generar=largo.instantiate()
		get_tree().current_scene.add_child(generar)
		generar.global_position=ubicacion.global_position
	
	if speed == 0:
		recogercuerda()
	

func recogercuerda():
	player.process_mode=Node.PROCESS_MODE_INHERIT
	var direccion=player.global_position-$Marker2D.global_position
	direccion*=-1
	player.velocity=10*direccion
	alargar=false
	
	var distance=player.global_position.distance_to($Marker2D.global_position)
	
	if distance<=min:
		player.move=true
		player.velocity.y=-500
		queue_free()
		
func _on_area_2d_gancho() -> void:
	speed=0

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("enganche"):
		speed=0
