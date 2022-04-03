if off = false
{
	mask_index = sprite_index
	alpha = 1
}else
{
	mask_index = spr_nothing
	alpha = 0.5
}

with obj_switch
{
	if index = other.index
	{
		other.off = not on	
	}
}