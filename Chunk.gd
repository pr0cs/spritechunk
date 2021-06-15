extends RigidBody2D

onready var sprite:Sprite = $Sprite

var chunk_size : Vector2 = Vector2(16,16)

func set_cut(cut_position) -> void:
	sprite.region_rect = Rect2(cut_position,chunk_size)
