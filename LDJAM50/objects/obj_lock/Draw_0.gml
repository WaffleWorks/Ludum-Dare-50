draw_set_alpha(alpha)
for(i = 0; i < image_yscale;i++)
{
	if i = 0
	{
		draw_sprite_ext(spr_locktile1,0,x,y,1,1,0,c_white,alpha)
		//draw_tile(tl_lock,1,0,x,y)//top
	}else if i = image_yscale-1
	{
		draw_sprite_ext(spr_locktile1,3,x,y+(i*16),1,1,0,c_white,alpha)
		//draw_tile(tl_lock,4,0,x,y+(i*16))//bottom
	}else if i = image_yscale / 2 + lock_half and image_yscale % 2 = 0
	or i = image_yscale / 2-0.5 and image_yscale % 2 != 0
	{
		draw_sprite_ext(spr_locktile1,1,x,y+(i*16),1,1,0,c_white,alpha)
		//draw_tile(tl_lock,2,0,x,y+(i*16))//middle w/ lock
	}else
	{
		draw_sprite_ext(spr_locktile1,2,x,y+(i*16),1,1,0,c_white,alpha)
		//draw_tile(tl_lock,3,0,x,y+(i*16))//middle no lock
	}
}


draw_set_alpha(1)