extends CharacterBody2D


@export var speed = 100
var screen_size


func _ready():
	screen_size = get_viewport_rect().size


func _process(delta):
	var vel = Vector2.ZERO
	var animation = ""
	
	
	if Input.is_action_pressed("move_left"):
		vel.x -= 1
		$AnimatedSprite2D.flip_h = true
		animation = "run_side"
	if Input.is_action_pressed("move_right"):
		vel.x += 1
		$AnimatedSprite2D.flip_h = false
		animation = "run_side"
	if Input.is_action_pressed("move_up"):
		vel.y -= 1
		animation = "run_up"
	if Input.is_action_pressed("move_down"):
		vel.y += 1
		animation = "run_down"
	
	
	if vel.length() > 0:
		vel = vel.normalized() * speed
	else:
		animation = "idle_front"
	
	
	$AnimatedSprite2D.play(animation)
	
	
	position += vel * delta
	position = position.clamp(Vector2.ZERO, screen_size)
