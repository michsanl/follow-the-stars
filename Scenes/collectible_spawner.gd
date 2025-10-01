extends Node2D

@export var collectible_scene: PackedScene
var collectibles = []
var spots = []

func _ready():
	# Store all spot nodes into array
	for child in get_children():
		if child is Node2D:
			spots.append(child)
	spawn_collectibles()

func spawn_collectibles():
	# Clear old collectibles list
	collectibles.clear()

	# Randomize order of spots
	var shuffled = spots.duplicate()
	shuffled.shuffle()

	# Spawn collectible in each spot
	for spot in shuffled:
		var roll = randi_range(0, 1)
		if roll == 0: continue
		
		var collectible = collectible_scene.instantiate()
		collectible.global_position = spot.global_position
		add_child(collectible)
		collectibles.append(collectible)

		# Connect signal when collectible is collected
		collectible.connect("collected", Callable(self, "_on_collectible_collected"))

func _on_collectible_collected(collectible):
	collectibles.erase(collectible)
	collectible.queue_free()

	# If all collected, respawn
	if collectibles.is_empty():
		await get_tree().create_timer(1).timeout
		spawn_collectibles()
