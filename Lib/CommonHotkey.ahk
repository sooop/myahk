#SingleInstance Force
;
; for AHK v2

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

; SC1F2 : Hangul
; SC1F1 : Hanja

; HotString Options
; * : Ending character not required.
; ? : Triggered even if it is inside other word.
; B0: No auto-backspace
; Kn: Key delay
; o : omit ending character

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

#HotIf GetKeyState("ScrollLock", "T") == 1
+Esc::Send("``")
#HotIf
:*:\8)::(headphones)
:*:\*::
{
	Send("{alt down}{numpad4}{numpad1}{numpad4}{numpad3}{numpad4}{alt up}")
	Send("{alt down}{numpad4}{numpad1}{numpad4}{numpad3}{numpad3}{alt up}{left}")
}
:o:\d1::
{
	Send("{alt down}{Numpad4}{Numpad3}{Numpad2}{Numpad3}{Numpad9}{alt up}")
}
:o:\d2::
{
	Send("{alt down}{Numpad4}{Numpad3}{Numpad2}{Numpad4}{Numpad0}{alt up}")
}
:o:\d3::
{
	Send("{alt down}{Numpad4}{Numpad3}{Numpad2}{Numpad4}{Numpad1}{alt up}")
}
:o:\d4::
{
	Send("{alt down}{Numpad4}{Numpad3}{Numpad2}{Numpad4}{Numpad2}{alt up}")
}
:o:\d5::
{
	Send("{alt down}{Numpad4}{Numpad3}{Numpad2}{Numpad4}{Numpad3}{alt up}")
}
:o:\d6::
{
	Send("{alt down}{Numpad4}{Numpad3}{Numpad2}{Numpad4}{Numpad4}{alt up}")
}
:o:\d7::
{
	Send("{alt down}{Numpad4}{Numpad3}{Numpad2}{Numpad4}{Numpad5}{alt up}")
}
:o:\d8::
{
	Send("{alt down}{Numpad4}{Numpad3}{Numpad2}{Numpad4}{Numpad6}{alt up}")
}
:o:\d9::
{
	Send("{alt down}{Numpad4}{Numpad3}{Numpad2}{Numpad4}{Numpad7}{alt up}")
}
:o:\d10::
{
	Send("{alt down}{Numpad4}{Numpad3}{Numpad2}{Numpad4}{Numpad8}{alt up}")
}
:?*:\r.::
{
	Send("{alt down}{Numpad1}{Numpad8}{Numpad3}{alt up}")
}
$SC1F2::Send("{SC1F2}")
SC1F2 & h::Send("{Left}")
SC1F2 & j::Send("{Down}")
SC1F2 & l::Send("{Right}")
SC1F2 & k::Send("{Up}")
