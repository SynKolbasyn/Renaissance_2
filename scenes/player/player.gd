extends CharacterBody2D


var speed = 100
var screen_size: Vector2
var direction: String = "down"

var max_health: int = 100
var current_health: int = max_health


func _ready():
	screen_size = get_viewport_rect().size
	position = screen_size / 2
	get_tree().call_group("GUI", "set_max_health", max_health)


func _process(delta):
	var vel = Vector2.ZERO
	var animation: String = "run_"
	
	
	if Input.is_action_pressed("move_left"):
		vel.x -= 1
		$AnimatedSprite2D.flip_h = true
		direction = "left"
	
	if Input.is_action_pressed("move_right"):
		vel.x += 1
		$AnimatedSprite2D.flip_h = false
		direction = "right"
	
	if Input.is_action_pressed("move_up"):
		vel.y -= 1
		direction = "up"
	
	if Input.is_action_pressed("move_down"):
		vel.y += 1
		direction = "down"
	
	if Input.is_action_pressed("attack") and (not $AnimationPlayer.is_playing()):
		$Weapon.show()
		$AnimationPlayer.play("attack_" + direction)
		current_health -= 1
		get_tree().call_group("GUI", "update_health", current_health)
	
	
	if not $AnimationPlayer.is_playing():
		$Weapon.hide()
	
	if vel.length() > 0:
		vel = vel.normalized() * speed
	else:
		animation = "idle_"
	
	
	$AnimatedSprite2D.play(animation + direction)
	
	
	position += vel * delta
	position = position.clamp(Vector2.ZERO, screen_size)
