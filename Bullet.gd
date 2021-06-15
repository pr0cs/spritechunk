extends KinematicBody2D

signal get_hit(at_position)

const SPEED : float = 500.0

var direction:Vector2
var velocity:Vector2
var collision_data : KinematicCollision2D

func _ready() -> void:
	set_movement_vector()
	
func _physics_process(delta) -> void:
	move_and_slide(velocity)
	if get_slide_count() != 0:
		collision_data = get_slide_collision(0)
		if collision_data != null and collision_data.collider.has_method("on_got_hit"):
			emit_signal("get_hit",collision_data.position+velocity.normalized())#tilemap will round up global world position to nearest tile in map
			
	
func set_movement_vector() -> void:
	direction = Vector2(cos(rotation),sin(rotation))# forward facing vect
	velocity = direction * SPEED
	
