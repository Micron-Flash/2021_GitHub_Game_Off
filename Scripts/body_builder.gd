extends Node2D

export(String, "Head", "Body", "Leg") var body_part
export(String, "Top", "Bottom", "Left", "Right") var snap_to_dirrection


func _ready():
	print(get_body_part())

func get_attach_point(type):
	var snap_points = get_node("SnapPoints")
	for point in snap_points.get_children():
		if point.snap_to_type == type:
			return point

func get_all_attach_points(type):
	var list = []
	var snap_points = get_node("SnapPoints")
	for point in snap_points.get_children():
		if point.snap_to_type == type:
			list.append(point)
	return list

func align_to_snap():
	if snap_to_dirrection == 'Left':
		self.scale = Vector2(-1,1)
		$SnapPoints/Position2D.position.x = $SnapPoints/Position2D.position.x * -1.0
	elif snap_to_dirrection == 'Right':
		self.scale = Vector2(1,1)
	

func get_body_part():
	return body_part
