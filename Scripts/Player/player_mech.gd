class_name Player
extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D

var direction : float = 0
var last_direction : float = 0
var was_on_floor : bool = is_on_floor()

@export var speed : float = 135
@export var acceleration : float = 250.0
@export var dash_acceleration : float = 1000.0
@export var friction : float = 625
@export var jump_velocity : float = -280.0
@export var gravity : float = 625.0
@export var fall_mult : float = 1.5

enum state{IDLE, WALK, JUMP, FALL, LAND, DASH}
@export var current_state = state.IDLE

func _physics_process(_delta: float) -> void:
	direction = Input.get_axis("Left", "Right")
	
	change_state()
	run_state(_delta)
	was_on_floor = is_on_floor()
	if direction != 0:
		last_direction = direction
	sprite.update_sprite()
	
	move_and_slide()

func run_state(delta) -> void:
	match current_state:
		state.IDLE:
			move_player_x(delta)
			move_player_y(delta)
		state.WALK:
			move_player_x(delta)
			move_player_y(delta)
		state.JUMP:
			move_player_x(delta)
			move_player_y(delta)
		state.FALL:
			move_player_x(delta)
			move_player_y(delta)
		state.LAND:
			move_player_x(delta)
		state.DASH:
			move_player_x(delta)
			move_player_y(delta)

func change_state():
	if is_on_floor() and not was_on_floor:
		current_state = state.LAND
	elif current_state != state.LAND:
		if is_on_floor() and Input.is_action_pressed("Dash"):
			current_state = state.DASH
		elif is_on_floor() and velocity.x == 0:
			current_state = state.IDLE
		elif velocity.x != 0 and is_on_floor():
			current_state = state.WALK
		elif velocity.y < 0 and not is_on_floor():
			current_state = state.JUMP
		elif velocity.y > 0 and not is_on_floor():
			current_state = state.FALL
	return

func move_player_x(delta):
	if current_state == state.LAND:
		velocity.x = 0
		
	if current_state == state.DASH:
		velocity.x = move_toward(velocity.x, 
			(speed * 2) * last_direction, 
			dash_acceleration * delta)
			
	if direction != 0:
		if velocity.x * direction < 0:
			velocity.x = move_toward(velocity.x, 
			speed * direction, 
			friction * delta)
		else:
			velocity.x = move_toward(velocity.x, 
			speed * direction, 
			acceleration * delta)
	
	elif direction == 0:
		velocity.x = move_toward(velocity.x, 
		0, 
		friction * delta)

func move_player_y(delta):
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump_velocity
	
	if Input.is_action_just_released("Jump") and not is_on_floor() and velocity.y < 0:
		velocity.y = move_toward(velocity.y, fall_mult, gravity / 5)
	
	if not is_on_floor():
		if velocity.y > 0:
			velocity.y += gravity * fall_mult * delta
		else:
			velocity.y += gravity * delta
