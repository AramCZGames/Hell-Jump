extends CharacterBody2D

func _ready() -> void:
	if _sfx_hurt:
		_sfx_hurt.process_mode = Node.PROCESS_MODE_ALWAYS

@export var gravity: float = 1400.0
@export var walk_speed: float = 300.0
@export var jump_speed: float = 600.0
@export var dash_speed: float = 900.0
@export var dash_duration: float = 0.12
@export var dash_cooldown: float = 0.35
@export var sprite_spin_speed: float = 14.0

var _dashing: bool = false
var _dash_ready: bool = true
var _facing: int = 1
var _dead: bool = false

@onready var _sprite := $Sprite2D
@onready var _sfx_jump := get_node_or_null("SfxJump") as AudioStreamPlayer2D
@onready var _sfx_dash := get_node_or_null("SfxDash") as AudioStreamPlayer2D
@onready var _sfx_hurt := get_node_or_null("SfxHurt") as AudioStreamPlayer2D

func _physics_process(delta: float) -> void:
	if _dead:
		return

	var dir := Input.get_axis("move_left", "move_right")
	if dir != 0:
		_facing = sign(dir)

	if not _dashing:
		velocity.x = dir * walk_speed
		velocity.y += gravity * delta

		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = -jump_speed
			if _sfx_jump:
				_sfx_jump.stop()
				_sfx_jump.play()

		if Input.is_action_just_pressed("dash") and _dash_ready:
			var dash_dir := _facing
			if dir != 0:
				dash_dir = sign(dir)
			_start_dash(dash_dir)
	else:
		velocity.y = 0
		if _sprite:
			_sprite.rotation += sprite_spin_speed * delta * _facing

	move_and_slide()

func _start_dash(dir: int) -> void:
	_dashing = true
	_dash_ready = false
	_facing = dir

	velocity.y = 0
	velocity.x = dash_speed * dir

	if _sfx_dash:
		_sfx_dash.play()

	_end_dash_async()

func _end_dash_async() -> void:
	await get_tree().create_timer(dash_duration).timeout
	_dashing = false

	if _sprite:
		_sprite.rotation = 0.0

	await get_tree().create_timer(dash_cooldown).timeout
	_dash_ready = true

func _on_spike_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and not _dead:
		_die()

func _die() -> void:
	_dead = true
	velocity = Vector2.ZERO

	if _sfx_hurt:
		_sfx_hurt.play()

	get_tree().paused = true

	var timer := get_tree().create_timer(1.0, true)
	timer.timeout.connect(_reload_room)


func _reload_room() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_secret_exit_body_entered(_body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/The hell/Level5+.tscn")


func _on_finish_line_body_entered(_body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/the_hell_level_select.tscn")

	if Input.is_action_just_pressed("exit_level"):
		get_tree().change_scene_to_file("res://Scenes/the_hell_level_select.tscn")


func _on_secret_exit_8_body_entered(_body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/The hell/Level8+.tscn")


func _on_secret_exit_11_body_entered(_body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/The hell/Level11+.tscn")


func _on_easter_egg_body_entered(_body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/HelloSimon.tscn")
