extends Node2D

var SkeletonSpawn = preload("res://Enemies/skeleton.tscn")

func _on_spawner_timeout() -> void:
	spawn()


func spawn():
	var Skeleton = SkeletonSpawn.instantiate()
	Skeleton.position = Vector2(randi_range(50,1500),550)
	$Enemies.add_child(Skeleton)
