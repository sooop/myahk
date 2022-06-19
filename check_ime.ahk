; Detect Hangul/English Langugage

IME_CHECK()
{
	WinGet, hWnd, ID, A
	Return Send_ImeControl(ImmGetDefaultIMEWnd(hWnd), 0x005, "")
}

Send_ImeControl(DefaultIMEWnd, wParam, lParam)
{
	DetectSave := A_DetectHiddenWindows
	DetectHiddenWindows, ON
	SendMessage 0x283, wParam, lParam, , ahk_id %DefaultIMEWnd%
	if (DetectSave <> A_DetectHiddenWindows)
		DetectHiddenWindows, %DetectSave%
	return ErrorLevel
}

ImmGetDefaultIMEWnd(hWnd)
{
	return DllCall("imm32\ImmGetDefaultIMEWnd", Uint, hWnd, Uint)
}

^+q::
Reload
ret := IME_CHECK()
MsgBox %ret%
return

