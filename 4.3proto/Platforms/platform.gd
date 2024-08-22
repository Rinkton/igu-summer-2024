extends StaticBody2D

@onready var above_material = preload("res://above_material.tres")


func _ready():
	await get_tree().create_timer(0.1).timeout
	var cur_side = get_tree().current_scene.cur_side
	if cur_side == get_tree().current_scene.get_node("above"):
		get_node("tilemap").material = above_material
		get_node("above_tilemap").material = above_material
	else:
		get_node("symmetry_link").obj.get_node("tilemap").material = above_material
		get_node("symmetry_link").obj.get_node("above_tilemap").material = above_material
