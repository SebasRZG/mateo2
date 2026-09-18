extends StaticBody2D

@onready var player = get_node("/root/Node2D/Midas")
signal gancho


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print("tas dentro")
		player.gancho= true
		player.enganche=$"."

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player.gancho= false
		player.enganche=null

func _on_area_2d_2_area_entered(area: Area2D) -> void:
	if area.has_method("lanzar"):
		area.lanzar()
