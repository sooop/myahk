#SingleInstance Force
;
; Detect Hangul/English Langugage
; for AHK v2

; Cache the imm32.dll for better performance
immModule := DllCall("LoadLibrary", "Str", "imm32.dll", "Ptr")

IMECheckHangul()
{
    hWnd := WinGetID("A")
    IMEWnd := DllCall("imm32\ImmGetDefaultIMEWnd", "UInt", hWnd, "UInt")
    temp := A_DetectHiddenWindows
    DetectHiddenWindows 1
    res := SendMessage(0x0283, 0x0005, 0x0000, , "ahk_id " IMEWnd)
    if (temp != A_DetectHiddenWindows)
        DetectHiddenWindows(temp)
    return res
}

; simple hot key
; hot key ends with "::"
; hot key modifiers
; - ^ : ctrl
; - # : win
; - + : shift
; - ! : alt
; hot key options
; - $ : use when Send same key in hotkey action
; - ~ : do not block hotkey's original behavior


#!r::Send "#S"
^+q::Reload

#!Space::
{
	Reload
	; 성공적으로 리로드되면 아래 코드는 실행되지 않는다.
	sleep 200
	MsgBox "Failed to reload"
}

; 테스트
$+F1::MsgBox(IMECheckHangul())


#HotIf (IMECheckHangul() == 0)
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
::\d1::{SC1F2}d{SC1F1}{PgDn 2}9{SC1F2}
::\d2::{SC1F2}d{SC1F1}{PgDn 3}1{SC1F2}
::\d3::{SC1F2}d{SC1F1}{PgDn 3}2{SC1F2}
::\d4::{SC1F2}d{SC1F1}{PgDn 3}3{SC1F2}
::\d5::{SC1F2}d{SC1F1}{PgDn 3}4{SC1F2}
::\d6::{SC1F2}d{SC1F1}{PgDn 3}5{SC1F2}
::\d7::{SC1F2}d{SC1F1}{PgDn 3}6{SC1F2}
::\d8::{SC1F2}d{SC1F1}{PgDn 3}7{SC1F2}
::\d9::{SC1F2}d{SC1F1}{PgDn 3}8{SC1F2}
::\d10::{SC1F2}d{SC1F1}{PgDn 3}9{SC1F2}
::\d11::{SC1F2}d{SC1F1}{PgDn 4}1{SC1F2}
::\d12::{SC1F2}d{SC1F1}{PgDn 4}2{SC1F2}
::\d13::{SC1F2}d{SC1F1}{PgDn 4}3{SC1F2}
::\d14::{SC1F2}d{SC1F1}{PgDn 4}4{SC1F2}
::\d15::{SC1F2}d{SC1F1}{PgDn 4}5{SC1F2}
#HotIf (IMECheckHangul() != 0)
:*:\*::a{SC1F1}8a{SC1F1}7{left}
::\d1::d{SC1F1}{PgDn 2}9
::\d2::d{SC1F1}{PgDn 3}1 ; ②
::\d3::d{SC1F1}{PgDn 3}2
::\d4::d{SC1F1}{PgDn 3}3
::\d5::d{SC1F1}{PgDn 3}4
::\d6::d{SC1F1}{PgDn 3}5
::\d7::d{SC1F1}{PgDn 3}6
::\d8::d{SC1F1}{PgDn 3}7
::\d9::d{SC1F1}{PgDn 3}8
::\d10::d{SC1F1}{PgDn 3}9
::\d11::d{SC1F1}{PgDn 4}1
::\d12::d{SC1F1}{PgDn 4}2
::\d13::d{SC1F1}{PgDn 4}3
::\d14::d{SC1F1}{PgDn 4}4
::\d15::d{SC1F1}{PgDn 4}5

#HotIf
:*:\8)::(headphones)
^F10::ExitApp


; F2 및 한/영 키를 누르고 있으면 Capslock이 되도록한다.
; SharpKeys 등을 사용해서 CapsLock을 한/영키로 맵핑한 후 사용하면
; MacOS 처럼 CapsLock을 누르고 있는 것으로 활성화할 수 있다.
; 참고로 중첩된 핫키를 바로 함수로 정의하여 작동하게 할 수 있다.
$F2::
$SC1F2::
    HoldToCapsLock(hk)
    {
		theKey := SubStr(hk, 2)
		try {
			if (KeyWait(theKey, "T0.3") == 1)
				Send("{" theKey "}")
			else {
				if (A_TimeSincePriorHotkey > 290)
					SetCapsLockState(!GetKeyState("CapsLock", "T"))
			}
		} catch Error as err {
			Send("{" theKey "}")
		}
    }

; Release imm32.dll when exit app
ExitFunc(ExitReason, ExitCode)
{
    DllCall("FreeLibrary", "Ptr", immModule)
}
OnExit(ExitFunc)
