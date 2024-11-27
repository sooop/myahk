; AutoHotkey V3
#SingleInstance Force


; Cache IMM32.dll file for better performance

immModule := DllCall("LoadLibrary", "Str", "imm32.dll", "Ptr")

IMECheckHangul()
{
    hWnd := WinGetID("A")
    IMEWnd := DllCall("imm32\ImmGetDefaultIMEWnd", "UInt", hWnd, "UInt")
    temp := A_DetectHiddenWindows
    DetectHiddenWindows 1
    res := SendMessage(0x0283, 0x0005, 0x0000, , "ahk_id " IMEWnd)
    DetectHiddenWindows(temp)
    return res
}

ExitFunc(ExitReason, ExitCode)
{
		DllCall("FreeLibrary", "Ptr", immModule)
}
OnExit(ExitFunc)

; HOT TO DEFINE HOTKEY
; {key[options]}::{action}
; KEY MODIFIER: ^(ctrl), !(alt), +(shift), #(win)
; OPTIONS: $(Same key will be sent in action), ~(do not block original key)

#Include <Utilities>
#Include <HotKeys>
#Include <HotStrings>
#Include <Numpad>
#Include <Password>
#Include <MouseSpeed>

#h::TLog("Win + H is not allowed befause it occurs IME clitch.")
^+q::
	{
		TLog("Reload...")
		Reload()
	}


Browser_Back::
Browser_Forward::
Browser_Refresh::
Browser_Search::
Browser_Favorites::
Browser_Home::
;Volume_Mute::
;Volume_Down::
;Volume_Up::
;Media_Next::
;Media_Prev::
;Media_Stop::
;Media_Play_Pause::
Launch_Mail::
Launch_Media::
Launch_App1::
Launch_App2::
	UXMeidaKey(hk) {
		TLog("Disabled> " hk)
	}
TLog("Loaded.")
