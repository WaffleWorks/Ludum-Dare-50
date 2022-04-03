if off = false
{
	mask_index = sprite_index
	alpha = 1
	
}else
{
	mask_index = spr_nothing
	alpha = 0.25
}
global.grid = mp_grid_create(0,0,hcells,vcells,cell_width,cell_height)
mp_grid_add_instances(global.grid,obj_groundparent,false)

with obj_switch
{
	if index = other.index
	{
		other.off = global.on	
	}
}