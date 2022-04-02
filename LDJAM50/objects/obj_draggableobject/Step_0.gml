//mouse released
if !mouse_check_button(mb_left) and grab = true
{
	if place_meeting(x,y,obj_inventory)
	{
		//back to inventory
		global.dragging = false
		instance_destroy()
		spawner_object.amount += 1
	}
	if place_meeting(x,y,obj_ground)
	or place_meeting(x,y,obj_draggableobject)
	or place_meeting(x,y,obj_player)
	or grounded = false
	{
		//go spawn to start pos
		x = x_onclick
		y = y_onclick
		grab = false
		global.dragging = false
		if placed = false
		{
			instance_destroy()
			spawner_object.amount += 1
		}
	}else
	{
		//successful release
		grab = false
		depth = 0
		global.dragging = false
		placed = true
	}
}

if grab = true
{
	if placed = true
	{
		x = mouse_x + xx
		y = mouse_y + yy
	}else
	{
		x = mouse_x - (sprite_width/2)
		y = mouse_y - (sprite_height/2)	
	}
	move_snap(16,16)
	//mask_index = spr_nothing
	used = false
}else
{
	vsp += grav
	mask_index = sprite_index
	//check if in proper location
}


//grounded
if place_meeting(x,y+1,obj_ground) or place_meeting(x,y+1,obj_bridge)
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
if (place_meeting(x,y+vsp,obj_ground))
{
    while (!place_meeting(x,y+onepixel,obj_ground))
    {
        y = y + onepixel;
    }
    vsp = 0;
}

if (place_meeting(x,y+vsp,obj_bridge))
{
    while (!place_meeting(x,y+onepixel,obj_bridge))
    {
        y = y + onepixel;
    }
    vsp = 0;
}
y = y + vsp;

//SNAP
