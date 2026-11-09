extends Node2D

const MOEDA = preload("res://Cenas/moeda.tscn")
const POSICAO_INICIAL = Vector2(87, 43)

# Lugares (em pixels) onde as moedas aparecem
const POSICOES_MOEDAS = [
	Vector2(168, 24),
	Vector2(392, 88),
	Vector2(488, 40),
	Vector2(568, 104),
	Vector2(56, 152),
	Vector2(232, 216),
	Vector2(136, 280),
	Vector2(488, 280),
]

var moedas = 0
var vidas = 3


func _ready() -> void:
	# Cria uma moeda em cada posição da lista
	for posicao in POSICOES_MOEDAS:
		var moeda = MOEDA.instantiate()
		moeda.position = posicao
		add_child(moeda)
	atualizar_textos()


func pegar_moeda() -> void:
	moedas += 1
	atualizar_textos()


func perder_vida() -> void:
	vidas -= 1
	$Player.position = POSICAO_INICIAL
	atualizar_textos()
	# Acabaram as vidas? Recomeça a fase.
	if vidas <= 0:
		get_tree().reload_current_scene()


func atualizar_textos() -> void:
	$HUD/TextoMoedas.text = "Moedas: " + str(moedas) + "/" + str(POSICOES_MOEDAS.size())
	$HUD/TextoVidas.text = "Vidas: " + str(vidas)
