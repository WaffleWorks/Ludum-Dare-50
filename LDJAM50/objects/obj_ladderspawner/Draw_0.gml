draw_self()
draw_set_font(fnt_amount)
draw_text_outlined(x+16,y+16,make_color_rgb(39,39,68),c_white,string(amount))

if instance_position(mouse_x,mouse_y,self) != noone and amount > 0
{
	image_index = 3 //yellow
}else
{
	image_index = 0
}