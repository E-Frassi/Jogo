extends Area2D

# O inimigo anda do ponto A até o ponto B e volta.
# Se o Player encostar nele, perde uma vida.

const VELOCIDADE = 40.0

@export var ponto_a := Vector2.ZERO
@export var ponto_b := Vector2.ZERO

var destino := Vector2.ZERO


func _ready() -> void:
	position = ponto_a
	destino = ponto_b
	body_entered.connect(_on_body_entered)


func _physics_process(delta: float) -> void:
	position = position.move_toward(destino, VELOCIDADE * delta)

	# Chegou no destino? Troca de destino.
	if position == destino:
		if destino == ponto_b:
			destino = ponto_a
		else:
			destino = ponto_b

	$"Animação".flip_h = destino.x < position.x


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		get_tree().current_scene.perder_vida()
