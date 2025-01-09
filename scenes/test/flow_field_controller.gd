class_name  FlowFieldController extends Node

var cell_radius:float=16
var grid_size:Vector2=Vector2(40,20)
var flow_field:FlowField

func init_self():
	pass

func create_flow_field():
	flow_field=FlowField.new()
	flow_field.init_self(cell_radius,grid_size)
	flow_field.create_grid()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click_left"):
		create_flow_field()
		flow_field.create_cost_field()
		$Node2D.cr()
