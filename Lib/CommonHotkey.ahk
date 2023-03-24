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

DoAltCode(altcode)
{
	arr := StrSplit(altcode, "")
	res := "{Alt Down}"
	for a in arr {
		res := res . "{NumPad" . a . "}"
	}
	res := res . "{Alt Up}"
	Send(res)
}

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
:o:\dt::
{
	DoAltcode("0149")
}
:o:\r.::
{
	DoAltcode("0183")
}
:o:\dw::
{
	DoAltcode("8361")
}
$SC1F2::Send("{SC1F2}")
SC1F2 & h::Send("{Left}")
SC1F2 & j::Send("{Down}")
SC1F2 & l::Send("{Right}")
SC1F2 & k::Send("{Up}")
