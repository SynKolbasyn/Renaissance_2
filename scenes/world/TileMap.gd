extends TileMap

var moisture = FastNoiseLite.new()
var temperature = FastNoiseLite.new()
var altitude = FastNoiseLite.new()
var width = 32
var height = 32
@onready var player = get_parent().get_child(0)

func _ready() -> void:
	moisture.seed = randi()
	temperature.seed = randi()
	altitude.seed = randi()

func _process(delta: float) -> void:
	generate_chunk(player.position)

func generate_chunk(position):
	var tile_pos = local_to_map(position)
	for x in range(width):
		for y in range(height):
			var moist = moisture.get_noise_2d(tile_pos.x-width/2 + x, tile_pos.y - height/2 + y)*10
			var temp = temperature.get_noise_2d(tile_pos.x-width/2 + x, tile_pos.y - height/2 + y)*10
			var alt = altitude.get_noise_2d(tile_pos.x-width/2 + x, tile_pos.y - height/2 + y)*10
			set_cell(0, Vector2i(tile_pos.x-width/2 + x, tile_pos.y-height/2 + y), 0, Vector2(round((moist+10)/8), round((temp+10)/8)))
#			set_cell(0, Vector2i(tile_pos.x-width/2 + x, tile_pos.y-height/2 + y), 0, Vector2i(1, 1))
