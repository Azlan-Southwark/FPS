extends CharacterBody3D
var mouse_sensitivity = 0.002
var  Speed = 5
var  Bullet = preload("res://bullet.tscn")
func  _physics_process(delta):
	var Direction = -$Camera3D.global_transform.basis.z
	

	if Input.is_action_just_pressed("Shoot"):
		var NewBullet = Bullet.instantiate()
		$"..".add_child(NewBullet)
		NewBullet.global_position = $Camera3D/Marker3D.global_position
		NewBullet.velocity = Direction * Speed * 20
	
	move_and_slide()

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		#rotate_x(-event.relative.y * mouse_sensitivity)
		#rotation_degrees.x = clampf(rotation_degrees.x, -10, 10)
		#rotation_degrees.z = clampf(rotation_degrees.z, -10, 10)
	if event.is_action_pressed("Shoot"):
		Shoot()
		
func Shoot():
	var space : PhysicsDirectSpaceState3D = get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create($Camera3D.global_position,
		$Camera3D.global_position - $Camera3D.global_transform.basis.z * 100)
	var collision = space.intersect_ray(query)
	if collision:
		var Pil = collision.collider.get_parent()
		var Collided = collision.collider.get_parent().is_in_group("Pillar")
		if Collided:
			Pil.get_node("Health").value -= 1
			print("Shot Pillar")
		$"../CanvasLayer/Label".text = collision.collider.get_parent().name
	else:
		$"../CanvasLayer/Label".text = ""
		print("Shot nothing")
