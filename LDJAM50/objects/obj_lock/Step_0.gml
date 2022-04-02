if unlocked = true
{
	mask_index = spr_nothing
	alpha -= 0.05
}

if alpha <= 0
{
	instance_destroy()	
}