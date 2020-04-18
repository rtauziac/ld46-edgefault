extends KinematicBody

export (float) var health = 1
export (float) var damage = 1

func hit(hitDamage: float):
	health -= hitDamage
