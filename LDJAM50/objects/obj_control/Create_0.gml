global.dragging = false
global.next_room = room

//next room
if room = Level1
{
	global.next_room = Level2	
}
if room = Level2
{
	global.next_room = Level3	
}
if room = Level3
{
	global.next_room = Level4	
}
if room = Level4
{
	global.next_room = Level5	
}
if room = Level5
{
	global.next_room = Level6
}
if room = Level6
{
	global.next_room = Level7
}
if room = Level7
{
	global.next_room = Level8
}
if room = Level8
{
	global.next_room = LastLevel
}



if room = LastLevel
{
	global.next_room = LastLevel
}