image_alpha = 0
//draw_bridge
for(i = 0; i < image_xscale;i++)
{
	if i = 0
	{
		draw_tile(tl_bridge,1,0,x,y-1)//left
	}else if i = image_xscale-1
	{
		draw_tile(tl_bridge,3,0,x+(i*16),y-1)//right
	}else
	{
		draw_tile(tl_bridge,2,0,x+(i*16),y-1)//middle
	}
}