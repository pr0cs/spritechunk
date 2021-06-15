extends Node2D

signal connect_bullet_to_tilemap(instanced_bullet)
var bullet_scene : PackedScene = preload("res://Bullet.tscn")
var chunk_scene : PackedScene = preload("res://Chunk.tscn")

func spawn_bullet(at_position, bullet_rotation) -> void:
	var bullet_instance = bullet_scene.instance()
	bullet_instance.global_position = at_position
	bullet_instance.rotation = bullet_rotation
	add_child(bullet_instance)
	emit_signal("connect_bullet_to_tilemap",bullet_instance)

func spawn_chunk(spawn_position, sprite_cut) -> void:
	var chunk_instance = chunk_scene.instance()
	chunk_instance.global_position = spawn_position
	add_child(chunk_instance)
	chunk_instance.set_cut(sprite_cut)
	
