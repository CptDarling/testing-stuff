# class_name Global
extends Node

func quit_safely() -> void:
	call_deferred("_deferred_quit")


func _deferred_quit() -> void:
	get_tree().quit()
