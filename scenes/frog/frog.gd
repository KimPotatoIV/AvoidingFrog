extends RigidBody2D

##################################################
var anim_node: AnimatedSprite2D
# AnimatedSprite2D 노드
var collision_node: CollisionShape2D
# CollisionShape2D 노드

##################################################
func _ready() -> void:
	anim_node = $AnimatedSprite2D
	collision_node = $CollisionShape2D
	# 각 노드 설정
	
	connect("body_entered", Callable(self, "_on_body_entered"))
	# 충돌 시 _on_body_entered 함수 실행되도록 연결

##################################################
func _process(delta: float) -> void:
	if not anim_node.is_playing():
	# 애니메이션이 재생 중이 아니면(죽는 애니메이션이 모두 재생 됐으면)
		queue_free()
		# 삭제

##################################################
func _on_body_entered(body: Node) -> void:
# 충동 시 실행되는 함수
	if body is TileMapLayer or body.is_in_group("Player"):
	# 충돌 body가 TileMapLayer이거나 Player 그룹이면(바닥이나 플레이어라면)
		GM.set_game_score(GM.get_game_score() + 1)
		# score 1 증가
		gravity_scale = 0.0
		# 중력 제거(터지는 와중에 떨어지면 안 되니까)
		anim_node.play("death")
		# 터지는 애니메이션 재생
		SM.play_explosion_sound()
		# 터지는 소리 재생
		call_deferred("disable_collision")
		# disable_collision 함수 지연 호출(물리연산 중 collision_node를 삭제하면 오류 발생)
		
		if body.is_in_group("Player"):
		# 충돌 body가 Player 그룹이면
			GM.set_game_over(true)
			# 게임 오버 설정
			SM.play_game_over_sound()
			# 게임 오버 소리 재생

##################################################
func disable_collision() -> void:
# collision_node 비활성화 함수
	collision_node.disabled = true
	# collision_node 비활성화
