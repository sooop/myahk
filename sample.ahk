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
        ; 0x283 = WM_IME_CONTROL
        ; 0x005 = ?
	SendMessage 0x283, wParam, lParam, , ahk_id %DefaultIMEWnd%
	if (DetectSave <> A_DetectHiddenWindows)
		DetectHiddenWindows, %DetectSave%
	return ErrorLevel
}

ImmGetDefaultIMEWnd(hWnd)
{
	return DllCall("imm32\ImmGetDefaultIMEWnd", Uint, hWnd, Uint)
}



; simple hot key
; hot key ends "::"
; ^ : ctrl
; # : win
; + : shift
; ! : alt


#!r::
Send, #S
Return


^+q::
Reload
Return

#!Space::
Reload
sleep 200
MsgBox, "Reloaded"
return


#If (IME_CHECK() = 0)
:*:optoin::option
:*:ensuer::ensure
:B:scooop::scoop
:*:langauge::language
:*:verison::version
:*:Fasle::False
:*:\mfn::[mfn][/mfn]{left 6}
:*:[mfn]::[mfn][/mfn]{left 6}
:*:[katex]::[katex][/katex]{left 8}
:*:\*::{SC1F2}a{SC1F1}8a{SC1F1}7{left}{SC1F2}
#If (IME_CHECK() = 1)
:*:\*::a{SC1F1}8a{SC1F1}7{left}
#If

; F2키를 누르고 있으면 Capslock이 되도록한다.
; 정상 작동하지만, 0.25초보다 오래 누르고 있으면 F2 키가 한 번 작동하는 문제는 있음.
$F2::
KeyWait F2, T0.3
If (ErrorLevel > 0 and A_TimeSincePriorHotkey > 250) {
  SetCapsLockState % !GetKeyState("CapsLock", "T")
} Else {
  Send {F2}
}
Return

:*:\8)::(headphones)



