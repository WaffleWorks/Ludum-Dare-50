if !place_meeting(x,y,obj_player) and global.dragging = false
{
	grab = true
	depth = -1

	xx = x - mouse_x
	yy = y - mouse_y
	
	x_onclick = x
	y_onclick = y
	global.dragging = true
}