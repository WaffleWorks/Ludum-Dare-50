global.dragging = false
global.on = true
global.next_room = room
blink = true

//next room
if room = Menu
{
	global.next_room = Level1
	alarm[0] = 30
}
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
	global.next_room = Level9
}
if room = Level9
{
	global.next_room = Level10
}
if room = Level10
{
	global.next_room = Level11
}
if room = Level11
{
	global.next_room = Level12
}
if room = Level12
{
	global.next_room = LastLevel
}
if room = LastLevel
{
	global.next_room = Credits
}
if room = Credits
{
	global.next_room = Menu
}