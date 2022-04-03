/// @description Insert description here
// You can write your code in this editor
if room = Menu
{
	draw_set_color(make_color_rgb(139,109,156))
	draw_set_font(fnt_creepy)
	draw_set_halign(fa_center)
	draw_set_valign(fa_center)
	if blink = true
	{
		draw_text(room_width/2,room_height/2-32,"Press Any Key to Begin.")
	}
}