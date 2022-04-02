if amount > 0 and global.dragging = false
{
	grab = true
	amount -= 1
	with instance_create_depth(x,y,depth,obj_ladder)
	{
		grab = true
		global.dragging = true
		spawner_object = obj_ladderspawner
		//image_yscale = 4
		xx = x - mouse_x
		yy = y - mouse_y
		depth = -1
	}
}