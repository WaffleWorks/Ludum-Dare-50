if on = true
{
	image_index = 0
}else
{
	image_index = 1
}

if place_meeting(x,y,obj_player)
{
	if x+8 = obj_player.x and switchable = false
	{
		on = not on
		switchable = true
		alarm[0] = 30
	}
	with obj_switchdoor
	{
		if other.index = index
		{
			off = not other.on
		}
	}

	global.grid = mp_grid_create(0,0,hcells,vcells,cell_width,cell_height)

	mp_grid_add_instances(global.grid,obj_groundparent,false)

}