//move_towards_point(obj_player.x,obj_player.y,0.75)

///create path and move towards it
var xx = (obj_player.x div 16) * 16
var yy = (obj_player.y div 16) * 16 - 2

if mp_grid_path(global.grid,path,x,y,xx,yy,true)
{
	path_start(path,0.75,path_action_stop,false)	
}

//facing
if direction >= 0 and direction <= 90
or direction <= 360 and direction >= 270
{
	image_xscale = 1	
}else
{
	image_xscale = -1
}

if place_meeting(x,y,obj_player)
{
	//room_restart()
}
