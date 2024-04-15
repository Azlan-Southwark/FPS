extends Camera3D

var mouse_sensitivity = 0.002
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
	
func _input(event):
	if event is InputEventMouseMotion:
		#rotate_y(-event.relative.x * mouse_sensitivity)
		rotate_x(-event.relative.y * mouse_sensitivity)
		rotation_degrees.x = clampf(rotation_degrees.x, -50, 50)
		#rotation_degrees.z = clampf(rotation_degrees.z, -10, 10)
