extends Node

##################################################
var game_score: int = 0
# 게임 점수
var game_over: bool = true
# 게임 오버 여부

##################################################
func get_game_score() -> int:
# 게임 점수 반환 함수
	return game_score
	# 게임 점수 반환

##################################################
func set_game_score(score_value: int) -> void:
# 게임 점수 설정 함수
	game_score = score_value
	# 게임 점수 설정

##################################################
func get_game_over() -> bool:
# 게임 오버 여부 반환 함수
	return game_over
	# 게임 오버 여부 반환

##################################################
func set_game_over(game_over_value: bool) -> void:
# 게임 오버 여부 설정 함수
	game_over = game_over_value
	# 게임 오버 여부 설정
