/// @description press any key
if room = Menu
{
	if keyboard_check_pressed(vk_anykey) and !instance_exists(obj_fadeout)
	or mouse_check_button_pressed(mb_any) and !instance_exists(obj_fadeout)
	{
		instance_create_depth(0,0,depth,obj_fadeout)	
	}
}