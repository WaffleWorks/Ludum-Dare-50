if alpha < 1
{
	alpha += 0.05	
}

if alpha >= 1
{
	if instance_exists(obj_player)
	{
		if obj_player.dead = true
		{
			room_restart()
		}else if obj_player.idle = true
		{
			room = global.next_room	
		}else
		{
			room = global.next_room	
		}
	}
	if instance_exists(obj_playernpc)
	{
		if obj_playernpc.dead = true
		{
			room = global.next_room	
		}else if obj_playernpc.idle = true
		{
			room = global.next_room	
		}else
		{
			room = global.next_room	
		}
	}
	if !instance_exists(obj_player) and !instance_exists(obj_playernpc)
	{
		room = global.next_room	
	}
}