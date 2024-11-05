extends Node2D


func QuitGame() -> void:
	get_tree().quit()


func PlayGame() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
