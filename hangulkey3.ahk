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
#Include <Pwd>
#Include <CommonHotKey>
#Include <Croad20>

#h::TLog("Win + H is not allowed befause it occurs IME clitch.")
^+q::
^NumpadEnter::
	{
		TLog("Reload")
		Reload()
	}
{

TLog("Loaded.")
