extends TileMapLayer

# ==========================================
# 1. 資料區 (Data) - 保持不變
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

var all_shapes = [i, t, o, z, s, l, j]

# Kick Table
var kick_table_jlstz = {
	[0, 1]: [Vector2i(0, 0), Vector2i(-1, 0), Vector2i(-1, -1), Vector2i(0, 2), Vector2i(-1, 2)],
	[1, 0]: [Vector2i(0, 0), Vector2i(1, 0), Vector2i(1, 1), Vector2i(0, -2), Vector2i(1, -2)],
	[1, 2]: [Vector2i(0, 0), Vector2i(1, 0), Vector2i(1, -1), Vector2i(0, 2), Vector2i(1, 2)],
	[2, 1]: [Vector2i(0, 0), Vector2i(-1, 0), Vector2i(-1, 1), Vector2i(0, -2), Vector2i(-1, -2)],
	[2, 3]: [Vector2i(0, 0), Vector2i(1, 0), Vector2i(1, 1), Vector2i(0, -2), Vector2i(1, -2)],
	[3, 2]: [Vector2i(0, 0), Vector2i(-1, 0), Vector2i(-1, -1), Vector2i(0, 2), Vector2i(-1, 2)],
	[3, 0]: [Vector2i(0, 0), Vector2i(-1, 0), Vector2i(-1, -1), Vector2i(0, 2), Vector2i(-1, 2)],
	[0, 3]: [Vector2i(0, 0), Vector2i(1, 0), Vector2i(1, 1), Vector2i(0, -2), Vector2i(1, -2)],
}

var kick_table_i = {
	[0, 1]: [Vector2i(0, 0), Vector2i(-2, 0), Vector2i(1, 0), Vector2i(-2, 1), Vector2i(1, -2)],
	[1, 0]: [Vector2i(0, 0), Vector2i(2, 0), Vector2i(-1, 0), Vector2i(2, -1), Vector2i(-1, 2)],
	[1, 2]: [Vector2i(0, 0), Vector2i(-1, 0), Vector2i(2, 0), Vector2i(-1, 2), Vector2i(2, -1)],
	[2, 1]: [Vector2i(0, 0), Vector2i(1, 0), Vector2i(-2, 0), Vector2i(1, -2), Vector2i(-2, 1)],
	[2, 3]: [Vector2i(0, 0), Vector2i(2, 0), Vector2i(-1, 0), Vector2i(2, 1), Vector2i(-1, -2)],
	[3, 2]: [Vector2i(0, 0), Vector2i(-2, 0), Vector2i(1, 0), Vector2i(-2, -1), Vector2i(1, 2)],
	[3, 0]: [Vector2i(0, 0), Vector2i(1, 0), Vector2i(-2, 0), Vector2i(1, -2), Vector2i(-2, 1)],
	[0, 3]: [Vector2i(0, 0), Vector2i(-1, 0), Vector2i(2, 0), Vector2i(-1, 2), Vector2i(2, -1)],
}

# ==========================================
# 2. 遊戲變數 (Variables)
# ==========================================
# ★★★ Player 2 偏移量設定 ★★★
const OFFSET_X = 20

var source_id = 1
var ghost_source_id = 0
var ghost_atlas_coords = Vector2i(7, 0)

var block_bag = []

var shape_index: int = 0
var shape_dir: int = 0

# 初始位置偏移
var current_pos = Vector2i(4 + OFFSET_X, 0)
var current_ghost_pos = Vector2i(4 + OFFSET_X, 0)

var lock_counter: int = 0
const lock_count: int = 60

# Hold 位置偏移 (原12 -> 32)
var hold_pos = Vector2i(12 + OFFSET_X, 1)
var hold_shape:int = -1
var hold_enable = true


enum Action { NONE, MOVE, ROTATE }
var last_actual_op = Action.NONE

var current_piece: Array:
	get:
		return all_shapes[shape_index][shape_dir]

func _ready():
	spawn_block()

func _physics_process(delta: float) -> void:
	lock_counter += 1
	
	if lock_counter >= lock_count:
		lock_counter = 0
		var move_check = current_pos
		move_down()
		if move_check == current_pos:
			clear_line()
			spawn_block()


func game_over():
	# 檢查生成點是否被擋住 (加上 OFFSET_X)
	if get_cell_source_id(Vector2i(4 + OFFSET_X, -1)) != -1 || get_cell_source_id(Vector2i(5 + OFFSET_X, -1)) != -1:
		print("遊戲結束！")
		set_physics_process(false) 
	
	# get_tree().reload_current_scene()

func spawn_block():
	game_over()
	shape_index = bag_randomnizer()
	shape_dir = 0
	# 生成位置偏移
	current_pos = Vector2i(4 + OFFSET_X, -2)
	last_actual_op = Action.NONE
	
	update_ghost()
	set_block(current_piece, current_pos, source_id)

func clear_line():
	var i = 19
	while i >= -1:
		var is_full = true
		# 掃描 X=20 到 X=29
		for j in range(OFFSET_X, 10 + OFFSET_X):
			var _id = get_cell_source_id(Vector2i(j, i))
			if _id == -1 or _id == ghost_source_id:
				is_full = false
				break
				
		if is_full:
			for line_to_move in range(i, 0, -1):
				move_line(line_to_move)
		else:
			i -= 1

func move_line(line: int):
	# 搬移 X=20 到 X=29
	for i in range(OFFSET_X, 10 + OFFSET_X):
		if line == 0:
			set_cell(Vector2i(i, line), -1)
		else:
			var former_atlas = get_cell_atlas_coords(Vector2i(i, line - 1))
			var former_source = get_cell_source_id(Vector2i(i, line - 1))
			
			if former_source == -1 or former_source == ghost_source_id:
				set_cell(Vector2i(i, line), -1)
			else:
				set_cell(Vector2i(i, line), 1, former_atlas)

func _input(event):
	# ★ 關鍵檢查：我是否有權控制這個方塊？
	# 如果我是 Host，我只能控制 P1；如果我是 Client，我只能控制 P2
	if not is_multiplayer_authority():
		return 

	if event is InputEventKey and event.pressed:
		match event.keycode:
			# 改成呼叫 RPC，而不是直接執行函式
			KEY_UP when not event.echo:
				do_action.rpc("rotate_cw")
			KEY_SPACE when not event.echo:
				do_action.rpc("drop")
			KEY_LEFT:
				do_action.rpc("move_left")
			KEY_RIGHT:
				do_action.rpc("move_right")
			KEY_DOWN:
				do_action.rpc("move_down")
			KEY_C:
				do_action.rpc("hold")
			KEY_Z when not event.echo:
				do_action.rpc("rotate_ccw")

# ==========================================
# 移動與旋轉
# ==========================================

func move_left():
	erase_ghost()
	set_block(current_piece, current_pos, -1)
	
	current_pos.x -= 1
	if check_collision(current_pos):
		current_pos.x += 1
	else:
		last_actual_op = Action.MOVE
		
	update_ghost()
	set_block(current_piece, current_pos, source_id)

func move_right():
	erase_ghost()
	set_block(current_piece, current_pos, -1)
	
	current_pos.x += 1
	if check_collision(current_pos):
		current_pos.x -= 1
	else:
		last_actual_op = Action.MOVE
	
	update_ghost()
	set_block(current_piece, current_pos, source_id)

func move_down():
	erase_ghost()
	set_block(current_piece, current_pos, -1)
	
	current_pos.y += 1
	if check_collision(current_pos):
		current_pos.y -= 1
	else:
		last_actual_op = Action.MOVE
	
	update_ghost()
	set_block(current_piece, current_pos, source_id)

func hold_block():
	if hold_enable:
		erase_ghost()
		set_block(current_piece, current_pos, -1)
		set_block(all_shapes[hold_shape][0],hold_pos,-1)
		var temp = shape_index
		shape_index = hold_shape
		hold_shape = temp
		set_block(all_shapes[hold_shape][0],hold_pos,1)	
		
	else:
		pass

func clockwise_rotate_block():
	erase_ghost()
	set_block(current_piece, current_pos, -1)
	
	var old_dir = shape_dir
	var new_dir = (shape_dir + 1) % 4
	shape_dir = new_dir
	
	var tests = []
	var rotation_key = [old_dir, new_dir]
	
	if shape_index == 0:
		tests = kick_table_i.get(rotation_key)
	elif shape_index == 2:
		tests = [Vector2i(0, 0)]
	else:
		tests = kick_table_jlstz.get(rotation_key)
		
	var kick_success = false
	if tests:
		for offset in tests:
			if not check_collision(current_pos + offset):
				current_pos += offset
				kick_success = true
				last_actual_op = Action.ROTATE
				break
	
	if kick_success:
		pass
	else:
		shape_dir = old_dir
		
	update_ghost()
	set_block(current_piece, current_pos, source_id)

func counter_clockwise_rotate_block():
	erase_ghost()
	set_block(current_piece, current_pos, -1)
	
	var old_dir = shape_dir
	var new_dir = shape_dir - 1
	if new_dir < 0:
		new_dir = 3
	shape_dir = new_dir
	
	var tests = []
	var rotation_key = [old_dir, new_dir]
	
	if shape_index == 0:
		tests = kick_table_i.get(rotation_key)
	elif shape_index == 2:
		tests = [Vector2i(0, 0)]
	else:
		tests = kick_table_jlstz.get(rotation_key)
		
	var kick_success = false
	if tests:
		for offset in tests:
			if not check_collision(current_pos + offset):
				current_pos += offset
				kick_success = true
				last_actual_op = Action.ROTATE
				break
	
	if kick_success:
		pass
	else:
		shape_dir = old_dir
		
	update_ghost()
	set_block(current_piece, current_pos, source_id)

func drop_block():
	set_block(current_piece, current_pos, -1)
	while true:
		current_pos.y += 1
		if check_collision(current_pos):
			current_pos.y -= 1
			break
	set_block(current_piece, current_pos, source_id)
	lock_counter = 60

# ==========================================
# 幽靈方塊
# ==========================================

func erase_ghost():
	set_ghost_block(current_piece, current_ghost_pos, -1)

func update_ghost():
	var new_ghost_pos = current_pos
	while true:
		new_ghost_pos.y += 1
		if check_collision(new_ghost_pos):
			new_ghost_pos.y -= 1
			break
	
	current_ghost_pos = new_ghost_pos
	set_ghost_block(current_piece, current_ghost_pos, ghost_source_id)

# ==========================================
# 輔助函式 (Set Block)
# ==========================================

func set_block(piece_array: Array, pos: Vector2i, id: int):
	for block_pos in piece_array:
		var final_pos = pos + block_pos
		
		if id == -1:
			if get_cell_source_id(final_pos) == source_id:
				set_cell(final_pos, -1)
		else:
			if pos == current_pos:
				match shape_index:
					0: set_cell(final_pos, id, Vector2i(0, 0))
					1: set_cell(final_pos, id, Vector2i(1, 0))
					2: set_cell(final_pos, id, Vector2i(2, 0))
					3: set_cell(final_pos, id, Vector2i(3, 0))
					4: set_cell(final_pos, id, Vector2i(4, 0))
					5: set_cell(final_pos, id, Vector2i(5, 0))
					6: set_cell(final_pos, id, Vector2i(6, 0))
			else :
				match hold_shape:
					0: set_cell(final_pos, id, Vector2i(0, 0))
					1: set_cell(final_pos, id, Vector2i(1, 0))
					2: set_cell(final_pos, id, Vector2i(2, 0))
					3: set_cell(final_pos, id, Vector2i(3, 0))
					4: set_cell(final_pos, id, Vector2i(4, 0))
					5: set_cell(final_pos, id, Vector2i(5, 0))
					6: set_cell(final_pos, id, Vector2i(6, 0))

func set_ghost_block(piece_array: Array, pos: Vector2i, id: int):
	for block_pos in piece_array:
		var final_pos = pos + block_pos
		
		if id == -1:
			if get_cell_source_id(final_pos) == ghost_source_id:
				set_cell(final_pos, -1)
		else:
			if get_cell_source_id(final_pos) == -1:
				set_cell(final_pos, id, ghost_atlas_coords)

func bag_randomnizer():
	if block_bag.is_empty():
		block_bag = [0, 1, 2, 3, 4, 5, 6]
		block_bag.shuffle()
	return block_bag.pop_front()

# 碰撞檢查：加上 OFFSET_X 的邊界判斷
func check_collision(test_pos: Vector2i) -> bool:
	var checker = false
	for block_pos in current_piece:
		var final_pos = test_pos + block_pos
		
		# 邊界修改：左邊是 OFFSET_X，右邊是 10 + OFFSET_X
		if final_pos.x < OFFSET_X or final_pos.x >= (10 + OFFSET_X) or final_pos.y >= 20:
			return true
			
		var _id = get_cell_source_id(final_pos)
		
		if _id != -1 and _id != ghost_source_id:
			checker = true
			
	return checker


# @rpc("any_peer") 代表任何人都可以呼叫我
# @rpc("call_local") 代表發送的人自己也會執行一次 (不用等網路由回傳)
@rpc("any_peer", "call_local")
func do_action(action_name: String):
	# 收到信號了！執行原本的動作
	match action_name:
		"rotate_cw":
			clockwise_rotate_block()
		"rotate_ccw":
			counter_clockwise_rotate_block()
		"move_left":
			move_left()
		"move_right":
			move_right()
		"move_down":
			move_down()
		"drop":
			drop_block()
		"hold":
			hold_block()
			# 修正 Hold 邏輯：交換後如果需要重生，位置要對
			if shape_index == -1:
				spawn_block()
			else:
				shape_dir = 0
				# 判斷我是 P1 (x=4) 還是 P2 (x=24)
				# 這裡用一個簡單的方法判斷：看現在位置
				if current_pos.x > 15: 
					current_pos = Vector2i(24, -2)
				else:
					current_pos = Vector2i(4, -2)
				last_actual_op = Action.NONE
