extends CharacterBody2D
## Jogador: movimentação em 4/8 direções e câmera que o segue.

@export var velocidade := 90.0

var direcao_olhando := Vector2.DOWN

@onready var sprite: Sprite2D = $Sprite2D
@onready var camera: Camera2D = $Camera2D


func _physics_process(_delta: float) -> void:
	var direcao := Input.get_vector("mover_esquerda", "mover_direita", "mover_cima", "mover_baixo")
	velocity = direcao * velocidade
	if direcao != Vector2.ZERO:
		direcao_olhando = direcao.normalized()
		if direcao.x != 0.0:
			sprite.flip_h = direcao.x < 0.0
	move_and_slide()


## Chamado pela Fase para impedir que a câmera mostre fora do mapa.
func definir_limites_camera(area: Rect2i) -> void:
	camera.limit_left = area.position.x
	camera.limit_top = area.position.y
	camera.limit_right = area.end.x
	camera.limit_bottom = area.end.y
