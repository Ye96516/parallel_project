extends Node2D

@export var cell_size: float = 32.0  # 方形单元格的边长
@export var grid_size: Vector2i = Vector2i(10, 10)

@export var grid_color: Color = Color.BLUE  # 网格线的颜色
@export var line_thickness: float = 2.0  # 线条粗细
var arr:Array
# 计算单元格位置
func _get_cell_position(row: int, col: int) -> Vector2:
	var x = col * cell_size
	var y = row * cell_size
	return Vector2(x, y)

# 绘制函数
func _draw():
	# 绘制水平线
	for row in range(grid_size.y + 1):
		var start = Vector2(0, row * cell_size)
		var end = Vector2(grid_size.x * cell_size, row * cell_size)
		draw_line(start, end, grid_color, line_thickness)
	
	# 绘制垂直线
	for col in range(grid_size.x + 1):
		var start = Vector2(col * cell_size, 0)
		var end = Vector2(col * cell_size, grid_size.y * cell_size)
		draw_line(start, end, grid_color, line_thickness)
	
	for i in range(grid_size.x ):
		for ii in (grid_size.y ):
			arr.append(Vector2(i,ii))
		
			
# 将世界坐标转换为网格坐标
func world_to_grid(world_pos: Vector2) -> Vector2i:
	var col = int(world_pos.x / cell_size)
	var row = int(world_pos.y / cell_size)
	return Vector2i(col, row)

# 将网格坐标转换为世界坐标（返回单元格中心点）
func grid_to_world(grid_pos: Vector2i) -> Vector2:
	var x = (grid_pos.x * cell_size) + (cell_size / 2)
	var y = (grid_pos.y * cell_size) + (cell_size / 2)
	return Vector2(x, y)

# 检查坐标是否在网格范围内
func is_within_grid(grid_pos: Vector2i) -> bool:
	return grid_pos.x >= 0 and grid_pos.x < grid_size.x and \
		   grid_pos.y >= 0 and grid_pos.y < grid_size.y

# 刷新网格
func update_grid():
	queue_redraw()

# 当参数改变时更新网格
func _on_parameter_changed():
	update_grid()

func cr():
	for i in Global.cost_array:
		creat_label(i[0],i[1])

func creat_label(cell_pos:Vector2i,cost:int):
	var world_pos:Vector2=Vector2(cell_pos.x*cell_size,cell_pos.y*cell_size)
	var label:Label=Label.new()
	label.text=str(cost)
	label.global_position=world_pos
	owner.add_child(label)
