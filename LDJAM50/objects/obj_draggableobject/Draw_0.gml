draw_self()
if sprite_index = init_sprite
{
	if grab = true
	{
		if place_meeting(x,y,obj_ground)
		or place_meeting(x,y,obj_draggableobject)
		or place_meeting(x,y,obj_player)
		or grounded = false
		{
			image_index = 1 //red
		}else
		{
			image_index = 2 //green
		}
	}else 
	{
		if instance_position(mouse_x,mouse_y,self) != noone and !place_meeting(x,y,obj_player) and global.dragging = false
		{
			image_index = 3 //yellow
		}else
		{
			image_index = 0
		}
	}

}