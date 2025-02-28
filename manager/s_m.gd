extends Node

##################################################
const EXPLOSION_SOUND: AudioStream = preload("res://sounds/maou_se_system10.wav")
const GAME_OVER_SOUND: AudioStream = preload("res://sounds/game_over.wav")
# 각 효과음 미리 불러오기

var effect_sound_player: AudioStreamPlayer
var game_over_sound_player: AudioStreamPlayer
# 각 효과음 플레이어

##################################################
func _ready() -> void:
	effect_sound_player = AudioStreamPlayer.new()
	add_child(effect_sound_player)
	# effect_sound_player 설정 및 노드 추가
	
	game_over_sound_player = AudioStreamPlayer.new()
	add_child(game_over_sound_player)
	# game_over_sound_player 설정 및 노드 추가

##################################################
func play_explosion_sound() -> void:
# 터지는 소리 재생 함수
	effect_sound_player.stream = EXPLOSION_SOUND
	effect_sound_player.play()
	# effect_sound_player stream 설정 후 재생

##################################################
func play_game_over_sound() -> void:
# 게임 오버 소리 재생 함수
	game_over_sound_player.stream = GAME_OVER_SOUND
	game_over_sound_player.play()
	# game_over_sound_player stream 설정 후 재생
