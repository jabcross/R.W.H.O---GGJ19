extends TileMap

func _ready():
	for tile_coord in get_used_cells():
		var name = tile_set.tile_get_name(get_cellv(tile_coord))
		print(name)
		var newtile = load("res://"+name+".tscn").instance()
		call_deferred("add_child",newtile)
		newtile.position.x = tile_coord.x * cell_size.x
		newtile.position.y = tile_coord.y * cell_size.y		
		set_cellv(tile_coord, -1)
