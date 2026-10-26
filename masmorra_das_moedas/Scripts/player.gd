extends CharacterBody2D

const VELOCIDADE = 80.0


func _physics_process(_delta: float) -> void:
	# Lendo as setas do teclado
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * VELOCIDADE
	move_and_slide()

	# escolhendo animação
	if velocity == Vector2.ZERO:
		$"Animação".play("idle")
	else:
		$"Animação".play("walk")

	# direção da animação (direita/esquerda)
	if velocity.x < 0.0:
		$"Animação".flip_h = true
	else:
		$"Animação".flip_h = false
