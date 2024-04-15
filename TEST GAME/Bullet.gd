extends CharacterBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var Col = move_and_collide(velocity * delta)
	#if Col:
		#velocity = velocity.bounce(Col.get_normal())
