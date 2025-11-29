extends Node2D

func _ready() -> void:
#	wait for the entire scene to be set up, and then freeze the screen.
	call_deferred('set_scene_procces_mode')

func set_scene_procces_mode() -> void:
	process_mode = PROCESS_MODE_DISABLED
