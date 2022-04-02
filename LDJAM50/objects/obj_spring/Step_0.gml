/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if sprung = true
{
	sprite_index = spr_spring
	if image_index = floor(sprite_get_number(spr_spring)-1)
	{
		sprung = false
	}
}else
{
	sprite_index = spr_spring2
}
mask_index = spr_spring2