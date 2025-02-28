extends CanvasLayer

##################################################
var current_score_label_node: Label
# CurrentScoreLabel 노드
var game_start_label_node: Label
# GameStartLabel 노드

var score: int = 0
# 잦은 업데이트를 제한하기 위한 점수 변수

##################################################
func _ready() -> void:
	current_score_label_node = $CurrentScoreLabel
	game_start_label_node= $GameStartLabel
	# 각 노드 설정

##################################################
func _process(delta: float) -> void:
	if not score == GM.get_game_score():
	# score와 게임 매니저의 score가 같지 않다면(잦은 업데이트를 제한하기 위함)
		score = GM.get_game_score()
		# score에 게임 매니저의 score 설정
		current_score_label_node.text = "SCORE " + str(score).pad_zeros(3)
		# current_score_label_node에 텍스트 업데이트(세 자리 숫자로 나타냄)
	
	game_start_label_node.visible = GM.get_game_over()
	# game_start_label_node 보여지는 여부를 게임 매니저의 게임 오버 여부로 설정
