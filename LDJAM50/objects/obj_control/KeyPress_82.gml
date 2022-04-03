/// @description restart room
if room != Menu and room != Credits
{
	global.next_room = room
	if !instance_exists(obj_fadeout)
	{
		instance_create_depth(0,0,0,obj_fadeout)	
	}
}