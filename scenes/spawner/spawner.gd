extends Node2D

##################################################
const FROG_SCENE: PackedScene = preload("res://scenes/frog/frog.tscn")
# 개구리 씬 미리 불러오기

var timer_node: Timer
# Timer 노드

##################################################
func _ready() -> void:
	timer_node = $Timer
	timer_node.wait_time = 1.0
	timer_node.start()
	# timer_node 설정
	
	timer_node.connect("timeout", Callable(self, "_on_timer_timeout"))
	# timer_node 시간 만료 시 _on_timer_timeout 실행되도록 연결

##################################################
func _on_timer_timeout() -> void:
# timer_node 시간 만료 시 실행되는 함수
	if not GM.get_game_over():
	# 게임 오버가 아니라면
		var frog_instance = FROG_SCENE.instantiate()
		frog_instance.position.x = randf_range(10.0, 352.0)
		frog_instance.position.y = -20.0
		add_child(frog_instance)
		# frog_instance 설정 및 노드 추가
	
	if GM.get_game_score() <= 10:
		timer_node.wait_time = 1.0
	elif GM.get_game_score() <= 30:
		timer_node.wait_time = 0.5
	elif GM.get_game_score() <= 50:
		timer_node.wait_time = 0.2
	elif GM.get_game_score() <= 100:
		timer_node.wait_time = 0.1
	# 게임 매니저 score에 따른 개구리 소환 시간 설정
	
	timer_node.start()
	# 타이머 시작(타이머 만료 시마다 개구리를 소환 후 재시작 하는 개념)
