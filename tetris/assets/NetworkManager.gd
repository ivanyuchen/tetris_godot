extends Node


@onready var ui = $CanvasLayer/UI
@onready var host_btn = $CanvasLayer/UI/HostButton
@onready var join_btn = $CanvasLayer/UI/JoinButton

@onready var player_1 = $Player1
@onready var player_2 = $Player2

const PORT = 7001
const DEFAULT_IP = "127.0.0.1"

func _ready():
	player_1.set_physics_process(false)
	player_2.set_physics_process(false)
	
	host_btn.pressed.connect(_on_host_pressed)
	join_btn.pressed.connect(_on_join_pressed)

# ... (前面的變數和 _ready 不用動) ...

func _on_host_pressed():
	var peer = ENetMultiplayerPeer.new()
	var error = peer.create_server(PORT, 2)
	if error != OK:
		print("無法建立伺服器: " + str(error))
		return
	multiplayer.multiplayer_peer = peer
	print("等待玩家加入...")
	_update_ui_state()
	
	# ★★★ 新增：主機永遠控制 Player 1 (ID 1) ★★★
	player_1.set_multiplayer_authority(1)
	_on_peer_connected(1)

func _on_join_pressed():
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(DEFAULT_IP, PORT)
	multiplayer.multiplayer_peer = peer
	print("連線中...")
	_update_ui_state()
	_on_peer_connected(2)

func _update_ui_state():
	ui.hide()

# ==========================================
# ★★★ 新增以下連線管理程式碼 ★★★
# ==========================================

# 當有人連進來時 (這個函式主要在 Host 端運作)
# --- 連線事件處理 ---

func _on_peer_connected(id):
	print("玩家 " + str(id) + " 已連線")
	
	if multiplayer.is_server():
		# 主機通知大家開始，並告訴大家 Player 2 歸誰管
		start_game.rpc(id)

func _on_peer_disconnected(id):
	print("玩家斷線: " + str(id))

# --- 遊戲控制 ---

# 注意：這裡多了一個參數 (p2_id)
@rpc("call_local", "authority")
func start_game(p2_id):
	print("遊戲開始！設定 P2 權限 ID: " + str(p2_id))
	
	# ★ 這行最重要：讓兩邊電腦都知道 P2 歸加入者管
	player_2.set_multiplayer_authority(p2_id)
	
	player_1.set_physics_process(true)
	player_2.set_physics_process(true)
	
	if player_1.has_method("spawn_block"):
		player_1.spawn_block()
	if player_2.has_method("spawn_block"):
		player_2.spawn_block()
