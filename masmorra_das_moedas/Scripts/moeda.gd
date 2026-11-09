extends Area2D

# A moeda avisa a cena Jogo quando o Player encosta nela.

func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		get_tree().current_scene.pegar_moeda()
		queue_free()
