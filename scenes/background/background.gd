extends Node2D

##################################################
const CLOUDS_SPEED: float = 5.0
# 구름 이동 속도

var clouds_sprite_1_node: Sprite2D
var clouds_sprite_2_node: Sprite2D
# 구름 노드

##################################################
func _ready() -> void:
	clouds_sprite_1_node = $Clouds1
	clouds_sprite_2_node = $Clouds2
	# 각 노드 설정

##################################################
func _process(delta: float) -> void:
	clouds_sprite_1_node.position.x -= CLOUDS_SPEED * delta
	clouds_sprite_2_node.position.x -= CLOUDS_SPEED * delta
	# 각 노드 우에서 좌로 CLOUDS_SPEED에 따라 이동
	
	if clouds_sprite_1_node.position.x <= -439.0:
		clouds_sprite_1_node.position.x = 360.0
	elif clouds_sprite_2_node.position.x <= -439.0:
		clouds_sprite_2_node.position.x = 360.0
	# 각 노드 일정 X 좌표 이상으로 좌측으로 이동 시 우측으로 좌표 재설정
