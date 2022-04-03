if place_meeting(x,y,obj_player) and obj_player.dead = false
{
	obj_player.dead = true
	audio_play_sound(snd_hurt,0,false)
	obj_player.image_alpha = 2
}