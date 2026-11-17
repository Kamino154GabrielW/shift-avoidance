extends CharacterBody2D

signal hit

@export var speed = 400 # Prędkość gracza (piksele/sekundę).
@export var health = 100
@export var infection_lv = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	pass

# Funkcja fizyczna – idealna dla CharacterBody2D i move_and_slide()
func _physics_process(delta: float) -> void:
	player_movement_func(delta) 
	look_at(get_global_mouse_position())
	
	# Obsługuje ruch i kolizje ze ścianami
	move_and_slide()

# Funkcja odpowiedzialna za obliczanie kierunku i prędkości
func player_movement_func(delta: float) -> void:
	var direction = Vector2.ZERO # Wektor kierunku (lokalny dla tej funkcji)
	
	if Input.is_action_pressed("P_Move_Right"):
		direction.x += 1
	if Input.is_action_pressed("P_Move_Left"):
		direction.x -= 1
	if Input.is_action_pressed("P_Move_Down"):
		direction.y += 1
	if Input.is_action_pressed("P_Move_UP"):
		direction.y -= 1

	# Jeśli gracz naciska jakiś klawisz ruchu
	if direction.length() > 0:
		direction = direction.normalized()
		velocity = direction * speed # Przypisujemy do wbudowanej zmiennej velocity
	else:
		velocity = Vector2.ZERO # Zatrzymanie postaci, gdy nic nie jest wciśnięte
