CoordMode, Mouse, Window
mins := 70


Loop, % mins * 10
{
	MouseMove, 1871, 751
	Sleep, % 1000 * 3
	MouseClick,Left, 1871, 1038
	Sleep, % 1000 * 3

}

ExitApp

!F5::ExitApp
