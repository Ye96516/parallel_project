class_name  FlowField extends Node2D

var cell_radius:float
var cell_diameter:float

var grid:Array[Cell]
var grid_size:Vector2=Vector2(10,10)
var destination_cell:Cell
var arr:Array

func init_self(cr:float,gs:Vector2):
	cell_radius=cr
	cell_diameter=cell_radius*2.0
	grid_size=gs

func create_grid():
	for x in grid_size.x:
		for y in grid_size.y:
			var world_pos=(Vector2(x*cell_diameter+cell_radius,y*cell_diameter+cell_radius))
			var cell:Cell=Cell.new()
			cell.init_self(world_pos,Vector2i(x,y))
			grid.append(cell)

var im_arry:Array[Vector2i]=[Vector2i(3,3),Vector2i(4,3),Vector2i(5,3)]
var tough_arry:Array[Vector2i]=[Vector2i(6,4),Vector2i(7,4),Vector2i(8,4),\
Vector2i(9,4),Vector2i(10,4),Vector2i(11,4)]
func create_cost_field():
	for cell in grid:
		if cell.cell_pos in im_arry:
			cell.increase_cost(255)
		elif cell.cell_pos in tough_arry:
			cell.increase_cost(3)
		arr.append([cell.cell_pos,cell.cost])
	Global.cost_array=arr
	print(arr.size())
