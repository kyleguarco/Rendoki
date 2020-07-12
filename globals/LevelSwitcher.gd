extends Node

"""
Manages the level switching at the top level.
"""

# Emitted before the scene is switched, but after the last level is freed.
signal switching

onready var _main = get_node("/root/Main")


func switch_level(scene):
	var last_level = _main.get_child(_main.get_child_count() - 1)
	var new_level = scene.instance()
	
	last_level.queue_free()
	emit_signal("switching")
	_main.add_child(new_level)
	