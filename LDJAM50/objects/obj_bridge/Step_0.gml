/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
grav = 0
event_inherited();

if place_meeting(x+1,y,obj_ground) or place_meeting(x-1,y,obj_ground)
{
	grounded = true
}else
{
	grounded = false
}