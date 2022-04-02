with obj_lock
{
	if other.index = index
	{
		unlocked = true
	}
}

if fade = false
{
	fade = true
	audio_play_sound(snd_unlock,0,false)
}