class_name Cell extends Node2D

var world_pos:Vector2
var cell_pos:Vector2i
var cost:int
var best_cost:int

func init_self(wp:Vector2,cp:Vector2i):
	world_pos=wp
	cell_pos=cp
	cost=1
	best_cost=65535

func increase_cost(amot:int):
	if cost+amot>=255:
		cost=255
		return
	cost+=amot



	
