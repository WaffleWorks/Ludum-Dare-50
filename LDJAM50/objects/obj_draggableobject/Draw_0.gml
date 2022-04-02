draw_self()
if grab = true
{
	if place_meeting(x,y,obj_ground)
	or place_meeting(x,y,obj_draggableobject)
	or place_meeting(x,y,obj_player)
	or grounded = false
	{
		image_alpha = 0.5
	}else
	{
		image_alpha = 1
	}
}else
{
	image_alpha = 1	
}