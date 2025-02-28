extends CharacterBody2D

##################################################
enum STATE {
	IDLE_L,
	IDLE_R,
	RUN_L,
	RUN_R,
	DEAD
}
# Player 상태 열거형 변수

enum DIRECTION {
	LEFT,
	RIGHT
}
# Player 방향 열거형 변수

const MOVING_SPEED: float = 200.0
# 이동 속도

var anim_node: AnimatedSprite2D
# AnimatedSprite2D 노드

var state: STATE = STATE.IDLE_R
# 상태 설정
var direction: DIRECTION = DIRECTION.RIGHT
# 방향 설정

##################################################
func _ready() -> void:
	anim_node = $AnimatedSprite2D
	# 노드 설정
	
	add_to_group("Player")
	# Player 그룹에 추가

##################################################
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
	# 스페이스 키를 누르면
		if GM.get_game_over():
		# 게임 오버라면
			GM.set_game_over(false)
			# 게임 오버가 아니게 설정
			GM.set_game_score(0)
			# 점수 0으로 설정
	
	if GM.get_game_over():
	# 게임 오버라면
		state = STATE.DEAD
		# 죽음 상태로 변경
		set_state(state)
		# 상태 적용
		return
		# 아래 줄이 실행되지 않도록 반환
	
	if not is_on_floor():
	# 바닥에 닿아있지 않다면
		velocity += get_gravity() * delta
		# 중력 적용을 위해 velocity 설정
	
	var input_direction: float = Input.get_axis("ui_left", "ui_right")
	# 좌우 입력값 설정
	if input_direction:
	# 좌우 입력값이 있다면
		velocity.x = input_direction * MOVING_SPEED
		# 좌우로 이동하도록 velocity 적용
		if input_direction < 0:
			direction = DIRECTION.LEFT
		elif input_direction > 0:
			direction = DIRECTION.RIGHT
		# input_direction에 따라 Player direction 설정
		
		if direction == DIRECTION.LEFT:
			state = STATE.RUN_L
		else:
			state = STATE.RUN_R
		# direction에 따라 state 설정
	else:
	# 좌우 입력값이 없다면
		velocity.x = move_toward(velocity.x, 0, MOVING_SPEED)
		# 정지 되도록 설정
		if direction == DIRECTION.LEFT:
			state = STATE.IDLE_L
		else:
			state = STATE.IDLE_R
		# direction에 따라 state 설정

	set_state(state)
	# 상태 적용
	move_and_slide()
	# 물리 적용

##################################################
func set_state(state_value: STATE) -> void:
# 상태 적용 함수
	match state_value:
		STATE.IDLE_L:
			anim_node.flip_h = true
			# sprite 좌우 반전
			anim_node.play("idle")
		STATE.IDLE_R:
			anim_node.flip_h = false
			anim_node.play("idle")
		STATE.RUN_L:
			anim_node.flip_h = true
			# sprite 좌우 반전
			anim_node.play("run")
		STATE.RUN_R:
			anim_node.flip_h = false
			anim_node.play("run")
		STATE.DEAD:
			anim_node.play("dead")
