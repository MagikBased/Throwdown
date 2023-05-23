extends CharacterBody3D

var currentSpace: Node
var nextSpace: Node

@export var movementSpeed: float = 5.0

func _physics_process(delta: float) -> void:
	if nextSpace != null:
		var direction = (nextSpace.global_transform.origin - global_transform.origin).normalized()
		var velocity = direction * movementSpeed
		move_and_slide()

		if global_transform.origin.distance_to(nextSpace.global_transform.origin) < movementSpeed * delta:
			currentSpace = nextSpace
			nextSpace = currentSpace.otherSpace  # Assuming you have a variable named "otherSpace" in the space node script.

func setStartSpace(startSpace: Node) -> void:
	currentSpace = startSpace
	nextSpace = currentSpace.otherSpace  # Assuming you have a variable named "otherSpace" in the space node script.
