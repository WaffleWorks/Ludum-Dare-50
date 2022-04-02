if alpha < 1
{
	alpha += 0.05	
}

if alpha >= 1
{
	if obj_player.dead = true
	{
		room_restart()
	}else if obj_player.idle = true
	{
		room = global.next_room	
	}
}