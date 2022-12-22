; Detect Hangul/English Langugage
; AutoHotkey V2

IMECheckHangul()
{
    hWnd := WinGetID("A")
    IMEWnd := DllCall("imm32\ImmGetDefaultIMEWnd", "UInt", hWnd, "UInt")
    temp := A_DetectHiddenWindows
    DetectHiddenWindows 1
    res := SendMessage(0x283, 0x005, 0x000, , "ahk_id " IMEWnd)
	DetectHiddenWindows(temp)
    return res
}


MsgBox(IMECheckHangul())
