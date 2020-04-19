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
	rdmz.seed = OS.get_system_time_secs()
	randomizeChoice()

func hit(hitDamage: float):
	if isAlive():
		print("Scorpion is hit")
	
	.hit(hitDamage)
	
	if !isAlive():
		print("Scorpion is dead")
		$"MainCollisionShape".disabled = true

func randomizeChoice():
	nextChoice = rdmz.randf_range(0.1, 0.8)
	match rdmz.randi_range(0, 7):
		0, 1:
			state = ScorpionState.moveLeft
		2, 3: 
			state = ScorpionState.moveRight
		4: 
			state = ScorpionState.moveForward
		5: 
			state = ScorpionState.moveBackward
		6: 
			state = ScorpionState.attack
			nextChoice = 0.2
		7: 
			state = ScorpionState.dodgeBack
			nextChoice = 0.2
		
func _process(delta):
	if isAlive():
		nextChoice -= delta
		if nextChoice < 0:
			randomizeChoice()
	
		var player: KinematicBody = get_parent().get_parent().find_node("Player")
		self.translation
		match state:
			ScorpionState.moveLeft:
				move_and_slide(flattenVector(-global_transform.basis.x) * speed * delta, Vector3(0, 1, 0))
				look_at(player.translation, Vector3(0, 1, 0))				
			ScorpionState.moveRight:
				move_and_slide(flattenVector(global_transform.basis.x) * speed * delta, Vector3(0, 1, 0))
				look_at(player.translation, Vector3(0, 1, 0))				
			ScorpionState.moveForward:
				move_and_slide(flattenVector(global_transform.basis.z) * speed * delta, Vector3(0, 1, 0))
				look_at(player.translation, Vector3(0, 1, 0))				
			ScorpionState.moveBackward:
				move_and_slide(flattenVector(-global_transform.basis.z) * speed * delta, Vector3(0, 1, 0))
				look_at(player.translation, Vector3(0, 1, 0))				
			ScorpionState.attack:
				move_and_slide(flattenVector(global_transform.basis.z) * speed * 4 * delta, Vector3(0, 1, 0))
			ScorpionState.dodgeBack:
				move_and_slide(flattenVector(-global_transform.basis.z) * speed * 4 * delta, Vector3(0, 1, 0))
		move_and_slide(Vector3(0, -1, 0))

func flattenVector(vector: Vector3):
	vector.y = 0
	return vector.normalized()
	
