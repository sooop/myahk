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
:?o:\r.::{SC1F2}r{SC1F1}{PgDn}8{SC1F2}

#HotIf (IMECheckHangul() != 0)
:*:\*::a{SC1F1}8a{SC1F1}7{left}
:o:\d1::d{SC1F1}{PgDn 2}9
:o:\d2::d{SC1F1}{PgDn 3}1 ; ??
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
#HotIf

:*:\8)::(headphones)
$SC1F2::Send("{SC1F2}")
SC1F2 & a::Send("^a")
SC1F2 & s::Send("^s")
SC1F2 & z::Send("^z")
SC1F2 & x::Send("^x")
SC1F2 & c::Send("^c")
SC1F2 & v::Send("^v")
SC1F2 & h::Send("{Left}")
SC1F2 & j::Send("{Down}")
SC1F2 & l::Send("{Right}")
SC1F2 & k::Send("{Up}")
