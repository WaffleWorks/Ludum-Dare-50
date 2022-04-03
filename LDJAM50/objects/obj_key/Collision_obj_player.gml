if obj_player.dead = false
{

	with obj_lock
	{
		if other.index = index
		{
			unlocked = true
		}
	}

	if fade = false
	{
		fade = true
		audio_play_sound(snd_unlock,0,false)
	}

	global.grid = mp_grid_create(0,0,hcells,vcells,cell_width,cell_height)

	mp_grid_add_instances(global.grid,obj_groundparent,false)

}