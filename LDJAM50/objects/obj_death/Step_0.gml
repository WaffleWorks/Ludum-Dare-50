//move_towards_point(obj_player.x,obj_player.y,0.75)

///create path and move towards it


xx = (obj_player.x div 16) * 16
yy = (obj_player.y div 16) * 16 - 2

if mp_grid_path(global.grid,path,x,y,xx,yy,false) and active = true
{
	path_start(path,1,path_action_stop,false) //0.75
}

if active = true
{
	if image_alpha < 1
	{
		image_alpha += 0.05
	}
}

//facing
if direction >= 0 and direction <= 45
or direction <= 360 and direction >= 315
{
	image_xscale = 1	
}
if direction >= 135 and direction <= 225
{
	image_xscale = -1
}

if place_meeting(x,y,obj_player) and active = true
{
	obj_player.dead = true
}

if instance_exists(obj_fadeout) or obj_player.dead = true
{
	path_end()
}