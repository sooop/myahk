
CoordMode, Mouse, Screen
WinGetPos, X, Y, Width, Height, A
X := X + Width / 2
Y := Y + Height / 2
L := 150
Loop, %L%,
{
	MouseMove, % X + 100 * Cos(A_Index  * 25 / L / 3.14), % Y + 100 * Sin(A_Index * 25 / L / 3.14)
}
