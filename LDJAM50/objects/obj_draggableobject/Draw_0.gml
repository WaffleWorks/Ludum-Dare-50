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
			snap = false
			image_index = 1 //red
		}else
		{
			snap = true
			image_index = 2 //green
		}
		if snap = false
		{
			image_alpha = 0
			if placed = true
			{
				draw_sprite(sprite_index,image_index,mouse_x+xx,mouse_y+yy)
			}else
			{
				draw_sprite(sprite_index,image_index,mouse_x - ((bbox_right + 1 - bbox_left)/2),mouse_y - ((bbox_bottom + 1 - bbox_top)/2)	)
			}
		}else
		{
			image_alpha = 1
		}
	}else 
	{
		image_alpha = 1
		if instance_position(mouse_x,mouse_y,self) != noone and !place_meeting(x,y,obj_player) and global.dragging = false
		{
			image_index = 3 //yellow
		}else
		{
			image_index = 0
		}
	}

}