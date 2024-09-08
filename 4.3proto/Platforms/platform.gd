extends StaticBody2D

@onready var above_material = preload("res://above_material.tres")


func _ready():
	if get_node_or_null("CollisionShape2D"):
		get_node_or_null("CollisionShape2D").visible = true
		var area2d = Area2D.new()
		add_child(area2d)
		var cs2d = CollisionShape2D.new()
		var shape = $CollisionShape2D.shape.duplicate()
		shape.size.x -= 15
		shape.size.y -= 25
		cs2d.shape = shape
		area2d.add_child(cs2d)
		area2d.connect("body_entered", _on_area_2d_body_entered)
	if get_node_or_null("CollisionPolygon2D"):
		# TODO: make specially for polygons their pressing area
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


func _on_area_2d_body_entered(body):
	if $CollisionShape2D.disabled == false and body.name == "character":
		get_tree().current_scene.reset_level()
