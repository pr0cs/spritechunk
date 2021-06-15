extends KinematicBody2D

onready var bullet_spawner : Node2D = $BulletSpawner

signal spawn_bullet(spawn_position, bullet_rotation)

func _process(delta) -> void:
	look_at(get_global_mouse_position())
	if(Input.is_action_just_pressed("LMB")):
		spawn_bullet()
		

func spawn_bullet() -> void:
	emit_signal("spawn_bullet", bullet_spawner.global_position,rotation)
