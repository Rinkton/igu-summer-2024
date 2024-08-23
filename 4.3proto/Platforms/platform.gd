extends StaticBody2D

@onready var above_material = preload("res://above_material.tres")


func _ready():
	if get_node_or_null("CollisionShape2D"):
		get_node_or_null("CollisionShape2D").visible = true
	if get_node_or_null("CollisionPolygon2D"):
		get_node_or_null("CollisionPolygon2D").visible = true
	await get_tree().create_timer(0.1).timeout
	var cur_side = get_tree().current_scene.cur_side
	if cur_side == get_tree().current_scene.get_node("above"):
		for child in get_children():
			if child is TileMap:
				child.material = above_material
	else:
		for child in get_node("symmetry_link").obj.get_children():
			if child is TileMap:
				child.material = above_material


func set_up_symmetric_object():
	if get_node_or_null("CollisionPolygon2D"):
		get_node("symmetry_link").obj.get_node("CollisionPolygon2D").disabled = true
		get_node("CollisionPolygon2D").disabled = false
