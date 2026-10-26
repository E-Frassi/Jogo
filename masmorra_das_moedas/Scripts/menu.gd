extends Control

# Menu inicial: dois botões, Jogar e Sair.

func _ready() -> void:
	$Centro/Caixa/BotaoJogar.pressed.connect(_ao_apertar_jogar)
	$Centro/Caixa/BotaoSair.pressed.connect(_ao_apertar_sair)
	$Centro/Caixa/BotaoJogar.grab_focus()


func _ao_apertar_jogar() -> void:
	get_tree().change_scene_to_file("res://Cenas/jogo.tscn")


func _ao_apertar_sair() -> void:
	get_tree().quit()
