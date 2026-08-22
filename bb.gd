extends RigidBody3D

@export_range(0.0, 10.0, 0.1) var backspin_drag: float = 1.0

func _ready():
	mass = 0.0002 # Massa padrão de 0,20g

func _physics_process(delta):
	var velocidade_atual = linear_velocity.length()
	
	if velocidade_atual > 0.1:
		# Fórmula: raiz da velocidade multiplicada pelo arrasto do backspin (convertendo escala)
		var hop_up_calibrado = backspin_drag * 0.0001
		var forca_sustentacao = sqrt(velocidade_atual) * hop_up_calibrado
		
		apply_central_force(Vector3.UP * forca_sustentacao)
