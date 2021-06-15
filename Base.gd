extends Node2D

onready var effects_node: Node2D = $Effects
onready var tilemap: TileMap = $TileMap

var player : KinematicBody2D

func _ready() -> void:
	player = $Player
	if(player != null):
		player.connect("spawn_bullet",self,"on_bullet_spawned")
		
func on_bullet_spawned(bullet_position, bullet_rotation) -> void:
	effects_node.spawn_bullet(bullet_position, bullet_rotation)


func _on_TileMap_spawn_chunk(chunk_position, sprite_cut):
	effects_node.spawn_chunk(chunk_position,sprite_cut)


func _on_Effects_connect_bullet_to_tilemap(instanced_bullet):
	instanced_bullet.connect("get_hit", tilemap,"on_got_hit")
