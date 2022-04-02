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
	vsp = 0
	walking = true
}
//spring
if place_meeting(x,y,obj_spring) and walking = true and instance_nearest(x,y,obj_spring).grounded = true
{
	if x - (sprite_width/2) = instance_nearest(x,y,obj_spring).x and y - (sprite_height/2) >= instance_nearest(x,y,obj_spring).y
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
		
	}
}
//dir blocks
if place_meeting(x+1,y,obj_leftblock)
{
	if instance_nearest(x,y,obj_leftblock).grab = false
	{
		dir = -1
	}
}
if place_meeting(x-1,y,obj_rightblock)
{
	if instance_nearest(x,y,obj_rightblock).grab = false
	{
		dir = 1
	}
}





//if all movement states are false, walk
if ladder = false and spring = false
{
	hsp = 1 * dir
	vsp = vsp + grv;
	walking = true
}else
{
	walking = true	
}
//ladder
if ladder = true
{
	hsp = 0
	vsp = -1
	spring = false
}
//spring
if spring = true
{
	vsp = vsp + grv;
	if vsp > 0 and grounded = true
	{
		spring = false
	}
}

//COLLISIONS
if place_meeting(x,y+1,obj_ground)
{
	grounded = true
}else
{
	grounded = false
}

//Check for horizontal collisions
var onepixel = sign(hsp)
if (place_meeting(x+hsp,y,obj_ground))
{
    while (!place_meeting(x+onepixel,y,obj_ground))
    {
        x = x + onepixel;
    }
    hsp = 0;
}
x = x + hsp;
//Check for vertical collision
var onepixel = sign(vsp)
//ground
if (place_meeting(x,y+vsp,obj_ground))
{
	while (!place_meeting(x,y+onepixel,obj_ground))
	{
	    y = y + onepixel;
	}
	vsp = 0;
}

if (place_meeting(x,y+vsp,obj_bridge))// and instance_nearest(x,y,obj_bridge).grab = false
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
		room_restart()
	}
}

move_snap(1,1)