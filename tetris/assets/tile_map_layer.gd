extends TileMapLayer

# ==========================================
# 1. 資料區 (Data) - 必須放在最上面
# ==========================================

# I 方塊
var i_0 = [Vector2i(0,1), Vector2i(1,1), Vector2i(2,1), Vector2i(3,1)]
var i_90 = [Vector2i(1,0), Vector2i(1,1), Vector2i(1,2), Vector2i(1,3)]
var i_180 = [Vector2i(0,2), Vector2i(1,2), Vector2i(2,2), Vector2i(3,2)]
var i_270 = [Vector2i(3,0), Vector2i(3,1), Vector2i(3,2), Vector2i(3,3)]
var i = [i_0, i_90, i_180, i_270]

# T 方塊
var t_0 = [Vector2i(1,0), Vector2i(0,1), Vector2i(1,1), Vector2i(2,1)]
var t_90 = [Vector2i(1,0), Vector2i(1,1), Vector2i(2,1), Vector2i(1,2)]
var t_180 = [Vector2i(0,1), Vector2i(1,1), Vector2i(2,1), Vector2i(1,2)]
var t_270 = [Vector2i(1,0), Vector2i(0,1), Vector2i(1,1), Vector2i(1,2)]
var t = [t_0, t_90, t_180, t_270]

# O 方塊
var o_0 = [Vector2i(0,0), Vector2i(1,0), Vector2i(0,1), Vector2i(1,1)]
var o = [o_0, o_0, o_0, o_0]

# Z 方塊
var z_0 = [Vector2i(0,0), Vector2i(1,0), Vector2i(1,1), Vector2i(2,1)]
var z_90 = [Vector2i(2,0), Vector2i(1,1), Vector2i(2,1), Vector2i(1,2)]
var z_180 = [Vector2i(0,1), Vector2i(1,1), Vector2i(1,2), Vector2i(2,2)]
var z_270 = [Vector2i(1,0), Vector2i(0,1), Vector2i(1,1), Vector2i(0,2)]
var z = [z_0, z_90, z_180, z_270]

# S 方塊
var s_0 = [Vector2i(1,0), Vector2i(2,0), Vector2i(0,1), Vector2i(1,1)]
var s_90 = [Vector2i(1,0), Vector2i(1,1), Vector2i(2,1), Vector2i(2,2)]
var s_180 = [Vector2i(1,1), Vector2i(2,1), Vector2i(0,2), Vector2i(1,2)]
var s_270 = [Vector2i(0,0), Vector2i(0,1), Vector2i(1,1), Vector2i(1,2)]
var s = [s_0, s_90, s_180, s_270]

# L 方塊
var l_0 = [Vector2i(2,0), Vector2i(0,1), Vector2i(1,1), Vector2i(2,1)]
var l_90 = [Vector2i(1,0), Vector2i(1,1), Vector2i(1,2), Vector2i(2,2)]
var l_180 = [Vector2i(0,1), Vector2i(1,1), Vector2i(2,1), Vector2i(0,2)]
var l_270 = [Vector2i(0,0), Vector2i(1,0), Vector2i(1,1), Vector2i(1,2)]
var l = [l_0, l_90, l_180, l_270]

# J 方塊
var j_0 = [Vector2i(0,0), Vector2i(0,1), Vector2i(1,1), Vector2i(2,1)]
var j_90 = [Vector2i(1,0), Vector2i(2,0), Vector2i(1,1), Vector2i(1,2)]
var j_180 = [Vector2i(0,1), Vector2i(1,1), Vector2i(2,1), Vector2i(2,2)]
var j_270 = [Vector2i(1,0), Vector2i(1,1), Vector2i(0,2), Vector2i(1,2)]
var j = [j_0, j_90, j_180, j_270]

# 總表 (Master Array) - 必須在上面所有變數都定義完之後
var all_shapes = [i, t, o, z, s, l, j]

# ==========================================
# 2. 遊戲變數 (Variables)
# ==========================================
var source_id = 1          # 請確認 TileSet ID
var block_bag = []

var shape_index: int = 0   # 目前是哪種方塊 (0~6)
var shape_dir: int = 0     # 目前旋轉角度 (0~3)
var current_pos = Vector2i(4, 0)

var current_piece: Array:
	get:
		return all_shapes[shape_index][shape_dir]

func _ready():
	pass
func _physics_process(delta: float) -> void:
	pass

func spawn_block():
	shape_index = bag_randomnizer()
	shape_dir = 0
	current_pos = Vector2i(4, 0)
	set_block(current_piece, source_id)
	
func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_UP and not event.echo:
			clockwise_rotate_block() 
		elif event.keycode == KEY_SPACE and not event.echo:
			drop_block()
		elif event.keycode == KEY_LEFT:
			move_left()
		elif event.keycode == KEY_RIGHT:
			move_right()
		elif event.keycode == KEY_DOWN:
			move_down()
		elif event.keycode == KEY_C and not event.echo:
			move_left()
		elif event.keycode == KEY_Z and not event.echo :
			move_left()
	
	

func move_left():
	set_block(current_piece, -1)
	current_pos.x -= 1
	if check_collision() :
		current_pos.x += 1
	set_block(current_piece, 1)
func move_right():
	set_block(current_piece, -1)
	current_pos.x += 1
	if check_collision() :
		current_pos.x -= 1
	set_block(current_piece, 1)
func move_down():
	set_block(current_piece, -1)
	current_pos.y += 1
	if check_collision() :
		current_pos.y -= 1
	set_block(current_piece, 1)


func clockwise_rotate_block():
	pass
func counter_clockwise_rotate_block():
	pass
	
func drop_block():
	set_block(current_piece,-1)
	while true:
		current_pos.y += 1
		if check_collision():
			current_pos.y -= 1
			break
	set_block(current_piece,source_id)
	





func set_block(piece_array: Array, source_ID: int):
	for block_pos in piece_array:
		# 將相對座標 (block_pos) 加上目前位置 (offset)
		var final_pos = current_pos + block_pos
		# 畫出方塊 (假設 source_id 是 0, 圖集座標是 0,0)
		set_cell(final_pos, source_ID, Vector2i(0, 0))

func bag_randomnizer():
	if block_bag.is_empty():
		block_bag = [0, 1, 2, 3, 4, 5, 6]
		block_bag.shuffle()
	return block_bag.pop_front()
			
func check_collision():
	var checker = false
	for i in current_piece:
		var _id = get_cell_source_id(i+current_pos)
		if _id != -1 :
			checker = true
	return checker
