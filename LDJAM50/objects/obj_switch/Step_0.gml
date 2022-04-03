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
		audio_play_sound(snd_switch,0,false)
	}
	with obj_switchdoor
	{
		if other.index = index
		{
			off = not other.on
		}
	}

	

}