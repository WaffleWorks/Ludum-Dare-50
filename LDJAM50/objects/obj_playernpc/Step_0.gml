if place_meeting(x,y,obj_npctrigger)
{
	hspeed = 0
	sprite_index = spr_playeridle
	image_xscale = -1
	triggered = true
}

if dead = true
{
	vspeed = -1
	sprite_index = spr_playerangel
}

if idle_on_start = true
{
	hsp = 0
	sprite_index = spr_playeridle
	if image_alpha < 1
	{
		image_alpha += 0.025	
	}
}else
{
	if dead = false and triggered = false
	{
		hspeed = 1
		sprite_index = spr_playerwalking
	}
}