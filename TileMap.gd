extends TileMap

var cell_library : Dictionary = {
	"0" : {
		"texture_start_position" : Vector2(0,0)
	}
}
signal spawn_chunk(chunk_position,sprite_cut)

var chunk_count : int = 4
var offset_value : float = 16


func on_got_hit(collision_position):
	var cell_position : Vector2 = world_to_map(collision_position)
	var cell_index : int = get_cellv(cell_position)
	if cell_index != -1:
		var offset: Vector2
		var chunk_sprite_cut_start = cell_library[str(cell_index)]["texture_start_position"]
		for x in range(0,4):
			for y in range(0,4):
				var spawn_position = map_to_world(cell_position) + offset
				var sprite_cut = chunk_sprite_cut_start + offset
				emit_signal("spawn_chunk", spawn_position + Vector2(8,8),sprite_cut)
				offset.y += offset_value
			offset.y =0
			offset.x += offset_value
		set_cellv(cell_position, -1)
				

