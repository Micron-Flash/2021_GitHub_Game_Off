extends Node2D

export(NodePath) var head_path
export(NodePath) var body_path
export(NodePath) var leg_path

onready var head_node = $Head
onready var body_node = $Body
onready var leg_node = $Legs

func _ready():
	var body = get_node(body_path)
	var head = get_node(head_path)
	var leg = get_node(leg_path)
	attach_legs(body)
	attach_body_part(body,head)

func attach_legs(_body):
	var type = 'Leg'
	var leg_instance = preload("res://Bodyparts/Leg1.tscn")
	var leg_points = _body.get_all_attach_points(type)
	for point in leg_points:
		print(point.snap_to_dirrection)
		var new_leg = leg_instance.instance()
		new_leg.snap_to_dirrection = point.snap_to_dirrection
		new_leg.align_to_snap()
		var base1_point = point
		var base2_point = new_leg.get_attach_point('Body')
		new_leg.position = Vector2(_body.position.x - base2_point.position.x + base1_point.position.x, _body.position.y - base2_point.position.y + base1_point.position.y)
		self.add_child(new_leg)
	
	

func attach_body_part(part1, part2):
	var part1_type = part1.get_body_part()
	var part2_type = part2.get_body_part()
	var base1_point = part1.get_attach_point(part2_type)
	var base2_point = part2.get_attach_point(part1_type)
	part2.position = Vector2(part1.position.x - base2_point.position.x + base1_point.position.x, part1.position.y - base2_point.position.y + base1_point.position.y)
