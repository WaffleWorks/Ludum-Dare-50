if amount > 0 and global.dragging = false
{
	grab = true
	amount -= 1
	with instance_create_depth(x,y,depth,obj_cratewide)
	{
		grab = true
		global.dragging = true
		spawner_object = obj_widecratespawner
		depth = -1
	}
}