; Detect Hangul/English Langugage

hModule := DllCall("LoadLibrary", "Str", "imm32.dll", "Ptr")

IMECheckHangul()
{
    hWnd := WinExist("A")
    IMEWnd := DllCall("imm32\ImmGetDefaultIMEWnd", "UInt", hWnd, "UInt")
	Temp := A_DetectHiddenWindows
	DetectHiddenWindows ON
	SendMessage 0x0283, 0x0005, 0x0000,, ahk_id %IMEWnd%
    Res := ErrorLevel
	if (Temp <> A_DetectHiddenWindows)
		DetectHiddenWindows %Temp%
	return Res
}

; =====================================================================
; simple hot key
; hot key ends "::"
; ^ : ctrl
; # : win
; + : shift
; ! : alt
; =====================================================================

#!r::Send #S
^+q::Reload

; =====================================================================
; hot string modifiers
; * : Ending character is not required
; B0: Auto backspace is not done
; O : Omit ending character
; ? : HotString can work even in the middle of word
; =====================================================================

#If (IMECheckHangul() = 0)
:*:optoin::option
:*:ensuer::ensure
:B:scooop::scoop
:*:langauge::language
:*:verison::version
:*:Fasle::False
:*:\mfn::[mfn][/mfn]{left 6}
:*:[mfn]::[mfn][/mfn]{left 6}
:*:[katex]::[katex][/katex]{left 8}
:*:\katex::[katex][/katex]{left 8}
:*:\*::{SC1F2}a{SC1F1}8a{SC1F1}7{left}{SC1F2}
:o:\d1::{SC1F2}d{SC1F1}{PgDn 2}9{SC1F2}
:o:\d2::{SC1F2}d{SC1F1}{PgDn 3}1{SC1F2}
:o:\d3::{SC1F2}d{SC1F1}{PgDn 3}2{SC1F2}
:o:\d4::{SC1F2}d{SC1F1}{PgDn 3}3{SC1F2}
:o:\d5::{SC1F2}d{SC1F1}{PgDn 3}4{SC1F2}
:o:\d6::{SC1F2}d{SC1F1}{PgDn 3}5{SC1F2}
:o:\d7::{SC1F2}d{SC1F1}{PgDn 3}6{SC1F2}
:o:\d8::{SC1F2}d{SC1F1}{PgDn 3}7{SC1F2}
:o:\d9::{SC1F2}d{SC1F1}{PgDn 3}8{SC1F2}
:o:\d10::{SC1F2}d{SC1F1}{PgDn 3}9{SC1F2}
:o:\d11::{SC1F2}d{SC1F1}{PgDn 4}1{SC1F2}
:o:\d12::{SC1F2}d{SC1F1}{PgDn 4}2{SC1F2}
:o:\d13::{SC1F2}d{SC1F1}{PgDn 4}3{SC1F2}
:o:\d14::{SC1F2}d{SC1F1}{PgDn 4}4{SC1F2}
:o:\d15::{SC1F2}d{SC1F1}{PgDn 4}5{SC1F2}
;:b0:\{:}-::{SC1F2}e{SC1F1}8{SC1F2}
:?o:\r.::{SC1F2}r{SC1F1}{PgDn}8{SC1F2}

#If (IMECheckHangul() = 1)
:o:\*::a{SC1F1}8a{SC1F1}7{left}
:o:\d1::d{SC1F1}{PgDn 2}9
:o:\d2::d{SC1F1}{PgDn 3}1 ; ②
:o:\d3::d{SC1F1}{PgDn 3}2
:o:\d4::d{SC1F1}{PgDn 3}3
:o:\d5::d{SC1F1}{PgDn 3}4
:o:\d6::d{SC1F1}{PgDn 3}5
:o:\d7::d{SC1F1}{PgDn 3}6
:o:\d8::d{SC1F1}{PgDn 3}7
:o:\d9::d{SC1F1}{PgDn 3}8
:o:\d10::d{SC1F1}{PgDn 3}9
:o:\d11::d{SC1F1}{PgDn 4}1
:o:\d12::d{SC1F1}{PgDn 4}2
:o:\d13::d{SC1F1}{PgDn 4}3
:o:\d14::d{SC1F1}{PgDn 4}4
:o:\d15::d{SC1F1}{PgDn 4}5
:o?:\r.::r{SC1F1}{PgDn}8
;①·②
#If
:*:\8)::(headphones)

; Press F2 for 0.3sec it works as CapsLock
$F2::
    ToggleCapsLock()
    {
        theKey := SubStr(A_ThisHotkey, 2)
        KeyWait %theKey%, "T0.3"
        WasLate := (ErrorLevel <> 0)
        if (!WasLate)
        { 
            Send {%theKey%} 
        }
        else
        {
            if (A_TimeSincePriorHotkey > 300)
	    ; If (A_ThisHotkey == A_PriorHotkey)
            {
                SetCapsLockState % !GetKeyState("CapsLock", "T")
            }
        }
    }
Return
;


#h::Send {Win}

$+F1::
MsgBox % IMECheckHangul()
Return

+F12::Send #.

OnExit("ExitFunc")

ExitFunc(ExitReason, ExitCode)
{
	DllCall("FreeLibrary", "Ptr", hModule)
}


