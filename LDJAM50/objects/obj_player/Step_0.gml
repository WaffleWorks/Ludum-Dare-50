//SET DIFFERENT STATES
//ladder
if place_meeting(x,y,obj_ladder) and walking = true and instance_nearest(x,y,obj_ladder).grounded = true and vsp <= 0
{
	if x - (sprite_width/2) = instance_nearest(x,y-56,obj_ladder).x and instance_nearest(x,y-56,obj_ladder).grab = false
	{
		ladder = true
		walking = false
	}
}
if !place_meeting(x,y,obj_ladder) and ladder = true 
{
	ladder = false
	x+=dir
	vsp = 0
	walking = true
	if grounded = false
	{
		sprite_index = spr_playerairborn
		image_index = 1
	}
}
//spring
if place_meeting(x,y,obj_spring) and walking = true and instance_nearest(x,y,obj_spring).grounded = true
{
	if x - (sprite_width/2) = instance_nearest(x,y,obj_spring).x and y - (8) >= instance_nearest(x,y,obj_spring).y
	and instance_nearest(x,y,obj_spring).used = false and instance_nearest(x,y,obj_spring).grab = false and vsp >= 0
	{
		//collide with spring
		instance_nearest(x,y,obj_spring).used = true
		instance_nearest(x,y,obj_spring).sprung = true
		instance_nearest(x,y,obj_spring).alarm[0] = 90
		spring = true
		walking = false
		vsp = vsp_spring
		hsp = 0
		
		audio_play_sound(snd_boing,0,false)
		
	}
}





//if all movement states are false, walk
if ladder = false and spring = false
{
	
	if hsp != 0 and grounded = true
	{
		sprite_index = spr_playerwalking
	}else if grounded = true
	{
		sprite_index = spr_playeridle	
	}
	if idle = false and idle_on_start = false
	{
		hsp = 1 * dir
	}
	if idle_on_start = true
	{
		hsp = 0
		sprite_index = spr_playeridle
	}
	vsp = vsp + grv;
	walking = true
	
}else
{
	walking = false	
}
//ladder
if ladder = true and dead = false
{
	hsp = 0
	vsp = -1
	spring = false
	mask_index = spr_playerclimbing
	sprite_index = spr_playerclimbing
}else if grounded = true
{
	if walking = true
	{
		mask_index = spr_playeridle
	}
}
//spring
if spring = true
{
	hsp = 0
	vsp = vsp + grv;
	if vsp > 0 and grounded = true
	{
		spring = false
	}
}

//airborn sprite
if grounded = false and sprite_index != spr_playerclimbing and mask_index != spr_playerclimbing
{
	sprite_index = spr_playerairborn
	if vsp < 0
	{
		image_index = 0
	}else
	{
		image_index = 1	
	}
}

//COLLISIONS
if place_meeting(x,y+1,obj_ground) or place_meeting(x,y+1,obj_bridge) and bbox_bottom < instance_nearest(x,y,obj_bridge).bbox_bottom
{
	grounded = true
}else if !place_meeting(x,y+1,obj_collidabledraggable)
{
	grounded = false
}else 
{
	if instance_nearest(x,y+8,obj_collidabledraggable).grab = false and spring = false
	{
		grounded = true
	}else
	{
		grounded = false
	}
}
show_debug_message(grounded)

//Check for horizontal collisions
var onepixel = sign(hsp)
var onepixel2 = sign(hsp)
//ground
if (place_meeting(x+hsp,y,obj_ground)) and dead = false
{
    while (!place_meeting(x+onepixel,y,obj_ground))
    {
        x = x + onepixel;
    }
	if grounded = true
	{
		dir *= -1
	}
    hsp = 0;
}
//object
if (place_meeting(x+hsp,y,obj_collidabledraggable))  and dead = false
{
	if instance_nearest(x,y+8,obj_collidabledraggable).grab = false
	{
	    //while (!place_meeting(x+sign(hsp),y,obj_collidabledraggable))
	    {
	        //x += sign(hsp)
	    }
		if grounded = true
		{
			dir *= -1
		}
	    hsp = 0;
	}
}
x = x + hsp;
//Check for vertical collision
var onepixel = sign(vsp)
var onepixel2 = sign(vsp)
//ground
if (place_meeting(x,y+vsp,obj_ground)) and dead = false
{
	while (!place_meeting(x,y+onepixel,obj_ground))
	{
	    y = y + onepixel;
	}
	vsp = 0;
}
//object
if (place_meeting(x,y+vsp,obj_collidabledraggable)) and dead = false
{
	if instance_nearest(x,y+8,obj_collidabledraggable).grab = false
	{
	    //while (!place_meeting(x,y+sign(vsp),obj_collidabledraggable))
	    {
	        //y += sign(vsp);
	    }
	    vsp = 0;
	}
}
//bridge
if (place_meeting(x,y+vsp,obj_bridge)) and dead = false // and instance_nearest(x,y,obj_bridge).grab = false
{
	if bbox_bottom < instance_nearest(x,y,obj_bridge).bbox_bottom
	and vsp >= 0
	{
		y = instance_nearest(x,y,obj_bridge).bbox_top - (bbox_bottom - y)
		vsp = 0
		walking = true
		grounded = true
	}else
	{
		y = y + vsp;	
	}

}else
{
	y = y + vsp;
}



//WIN LEVEL

if place_meeting(x,y,obj_finishline)
{
	if x - (sprite_width/2) = obj_finishline.x
	{
		if !instance_exists(obj_fadeout)
		{
			audio_play_sound(snd_win,0,false)
			instance_create_depth(0,0,0,obj_fadeout)
			idle = true
			hsp = 0
			sprite_index = spr_playeridle
			//room_restart()
		}
	}
}

//DIE
if dead = true
{
	sprite_index = spr_playerangel
	if image_alpha > 0
	{
		image_alpha -= 0.025
	}
	if image_alpha <= 0 and !instance_exists(obj_fadeout)
	{
		instance_create_depth(x,y,depth,obj_fadeout)
	}
	idle = true
	hsp = 0
	vsp = -1
	image_speed = 0	
}else
{
	if image_alpha < 1
	{
		image_alpha += 0.025	
	}
}

move_snap(1,1)