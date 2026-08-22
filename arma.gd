extends Node3D

@export var bb_scene: PackedScene
@onready var boca_do_cano = $BocaDoCano

# Velocidade inicial calculada a partir dos 1.49 joules
var velocidade_inicial = 122.06 

func _input(event):
	if event.is_action_pressed("click_esquerdo"):
		atirar()

func atirar():
	if bb_scene:
		var nova_bb = bb_scene.instantiate()
		get_tree().current_scene.add_child(nova_bb)
		nova_bb.global_transform = boca_do_cano.global_transform
		nova_bb.linear_velocity = -boca_do_cano.global_basis.z * velocidade_inicial
