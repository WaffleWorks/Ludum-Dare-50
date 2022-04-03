if amount > 0 and global.dragging = false
{
	grab = true
	amount -= 1
	with instance_create_depth(x,y,depth,obj_cratetall)
	{
		grab = true
		global.dragging = true
		spawner_object = obj_tallcratespawner
		depth = -1
	}
}