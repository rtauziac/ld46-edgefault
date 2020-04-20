extends KinematicBody

export (float) var health = 1
export (float) var damage = 1

func isAlive():
	return health > 0

func hit(hitDamage: float):
	if isAlive():
		health -= hitDamage
	
