extends Node


var obj


func _exit_tree():
	if is_instance_valid(obj):
		obj.queue_free()
