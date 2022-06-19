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

#!Space::
Reload
sleep 200
MsgBox Reloaded
return


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
;:b0:\{:}-::{SC1F2}e{SC1F1}8{SC1F2}

#If (IMECheckHangul() = 1)
::\*::a{SC1F1}8a{SC1F1}7{left}
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

#If
:*:\8)::(headphones)

; ⓐ ⓐ ㅇ ① d a8a7

; Press F2 for 0.25sec it works as CapsLock
$F2::
$SC1F2::
    ToggleCapsLock()
    {
        theKey := SubStr(A_ThisHotkey, 2)
        KeyWait %theKey%, "T0.3"
        WasLate := (ErrorLevel <> 0)
        if (!WasLate)
            Send {%theKey%}
        else
        {
            if (A_TimeSincePriorHotkey > 290)
            {
                SetCapsLockState % !GetKeyState("CapsLock", "T")
            }
        }
    }
;
Return
; KeyWait F2, T0.25
; WasLate := ErrorLevel <> 0
; if (!WasLate)
; 	Send {F2}
; else
; {
; 	if (A_TimeSincePriorHotkey > 210)
; 	{
; 		SetCapsLockState % !GetKeyState("CapsLock", "T")
; 		; Sleep 200
; 	}
; }
; Return

$+F1::
MsgBox % IMECheckHangul()


OnExit("ExitFunc")
    
ExitFunc(ExitReason, ExitCode)
{
	DllCall("FreeLibrary", "Ptr", hModule)
}
