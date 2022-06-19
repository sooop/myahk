


MsgBox, %A_WorkingDir%

CoordMode, Mouse, Window
CoordMode, Pixel, Window

vx := 500
vy := 500

PageW := 530
PageH := 890
originX := 918
originY := 110
endX := originX + PageW
endY := originY + PageH

F1::
Loop, 20 {
	ImageSearch, vx, vy, %originX%, %originY%, %endX%, %endY%, *30 Camfit_Btn01.png
	if (ErrorLevel = 0)
	{
		MouseMove, % vx + 20 , % vy + 20
		Break
	}
	else
	{
		MouseClick, WheelDown,,,6
		Sleep 200
	}
}
return

F2::
MouseMove, %vx%, %vy%
return

F3::
ExitApp

$+F5::
Reload
Sleep, 1000
MsgBox, "Failed to reload"
return
