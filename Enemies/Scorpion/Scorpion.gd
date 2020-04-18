extends "res://Enemies/EnemyBase.gd"

enum ScorpionState {
	moveRight,
	moveLeft,
	moveForward,
	moveBackward,
	dodgeBack,
	attack
}

export (float) var speed = 10

var rdmz = RandomNumberGenerator.new()
var state = ScorpionState.moveRight
var nextChoice = 2

func _ready():
	randomize()

func hit(hitDamage: float):
	if isAlive():
		print("Scorpion is hit")
	
	.hit(hitDamage)
	
	if !isAlive():
		print("Scorpion is dead")
		
func _process(delta):
	if isAlive():
		nextChoice -= delta
		if nextChoice < 0:
			nextChoice = rdmz.randf_range(0.5, 3)		
			match rdmz.randi_range(0, 5):
				0:
					state = ScorpionState.moveLeft
				1: 
					state = ScorpionState.moveRight
				2: 
					state = ScorpionState.moveForward
				3: 
					state = ScorpionState.moveBackward
				4: 
					state = ScorpionState.attack
					nextChoice = 0.8
				5: 
					state = ScorpionState.dodgeBack
					nextChoice = 0.8
	
		var player: KinematicBody = get_parent().get_parent().find_node("Player")
		look_at(player.translation, Vector3(0, 1, 0))
		match state:
			ScorpionState.moveLeft:
				move_and_slide(flattenVector(-global_transform.basis.x) * speed * delta, Vector3(0, 1, 0))
			ScorpionState.moveRight:
				move_and_slide(flattenVector(global_transform.basis.x) * speed * delta, Vector3(0, 1, 0))
			ScorpionState.moveForward:
				move_and_slide(flattenVector(global_transform.basis.z) * speed * delta, Vector3(0, 1, 0))
			ScorpionState.moveBackward:
				move_and_slide(flattenVector(-global_transform.basis.z) * speed * delta, Vector3(0, 1, 0))
			ScorpionState.attack:
				move_and_slide(flattenVector(global_transform.basis.z) * speed * 3 * delta, Vector3(0, 1, 0))
			ScorpionState.dodgeBack:
				move_and_slide(flattenVector(-global_transform.basis.z) * speed * 3 * delta, Vector3(0, 1, 0))
				
		move_and_slide(Vector3(0, -1, 0))

func flattenVector(vector: Vector3):
	vector.y = 0
	return vector.normalized()
	
