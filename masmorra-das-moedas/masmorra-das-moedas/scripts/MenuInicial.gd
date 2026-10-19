extends Control
## Menu inicial: Iniciar, Créditos e Sair.

const CENA_JOGO := "res://cenas/Fase.tscn"

@onready var menu: VBoxContainer = $Centro/Menu
@onready var creditos: VBoxContainer = $Centro/Creditos
@onready var botao_iniciar: Button = $Centro/Menu/BotaoIniciar
@onready var botao_creditos: Button = $Centro/Menu/BotaoCreditos
@onready var botao_sair: Button = $Centro/Menu/BotaoSair
@onready var botao_voltar: Button = $Centro/Creditos/BotaoVoltar


func _ready() -> void:
	botao_iniciar.pressed.connect(_ao_apertar_iniciar)
	botao_creditos.pressed.connect(_ao_apertar_creditos)
	botao_sair.pressed.connect(_ao_apertar_sair)
	botao_voltar.pressed.connect(_ao_apertar_voltar)
	_mostrar_menu()


func _mostrar_menu() -> void:
	menu.visible = true
	creditos.visible = false
	botao_iniciar.grab_focus()


func _ao_apertar_iniciar() -> void:
	get_tree().change_scene_to_file(CENA_JOGO)


func _ao_apertar_creditos() -> void:
	menu.visible = false
	creditos.visible = true
	botao_voltar.grab_focus()


func _ao_apertar_sair() -> void:
	get_tree().quit()


func _ao_apertar_voltar() -> void:
	_mostrar_menu()
