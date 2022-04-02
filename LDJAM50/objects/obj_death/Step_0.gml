//move_towards_point(obj_player.x,obj_player.y,0.75)

///create path and move towards it
var xx = (obj_player.x div 16) * 16 - 8
var yy = (obj_player.y div 16) * 16 - 8

if mp_grid_path(global.grid,path,x,y,xx,yy,true)
{
	path_start(path,0.75,path_action_stop,false)	
}

if place_meeting(x,y,obj_player)
{
	room_restart()
}