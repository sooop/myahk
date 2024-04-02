
;+SC1F2::
;{
;	SetCapsLockState(!GetKeyState("CapsLock", "T"))
;}
+CapsLock::
^CapsLock::
    {
        Send("{AppsKey}")
    }

!NumpadEnter::
    {
		TLog(IMECheckHangul() ? "Hangul" : "English")
    }

NumpadEnter & NumpadDot::Send("{Ins}")
NumpadEnter & Numpad0::
{
	Send("^a")
	Send("{text}ekRntmxlzj@myR23")
	Send("{Enter}")
}

NumpadAdd & NumpadSub::Send("{BS}")
NumpadAdd & Numpad0::Send("{Space}")
NumpadAdd & Numpad7::Send("{Home}")
NumpadAdd & Numpad8::Send("{End}^}")
NumpadAdd & Numpad9::
{
	Send("{Ins}")
	YN_Ins := GetKeyState("Insert", "T")
	Tooltip(YN_Ins ? "Overwrite" : "Insert")
	SetTimer(() => Tooltip(), 1000)
}
NumpadAdd & Numpad4::Send("{PgUp}")
NumpadAdd & Numpad5::Send("{PgDn}")
NumpadAdd & Numpad6::Send("{Del}")
NumpadAdd & Numpad1::Send("[")
NumpadAdd & Numpad2::Send("{!}")
NumpadAdd & Numpad3::
{

}
$NumpadEnter::Send("{NumpadEnter}")
$NumpadAdd::Send("{NumpadAdd}")
;Numpad0 & NumpadDot::Send(",")
;Numpad0 & Numpad1::Send("^c")
;Numpad0 & Numpad2::Send("^v")
;$Numpad0::Send("{Numpad0}")
+NumLock::Esc
^NumpadDot::Send(",")
^NumpadSub::Send("{BackSpace}")
^NumpadMult::Send("_")
^NumpadDiv::Send("%")
^Numpad7::Send("(")
^Numpad8::Send("{^}")
^Numpad9::Send(")")
^Numpad6::Send(">")
^Numpad5::Send(":")
^Numpad4::Send("<")
^Numpad1::Send("[")
^Numpad2::Send("{!}")
^Numpad3::Send("]")
^NumpadAdd::Send("=")
^Numpad0::Send("{Space}")


!NumpadHome::
!NumpadUp::
!NumpadPgup::
!NumpadLeft::
!NumpadRight::
!NumpadEnd::
!NumpadDown::
!NumpadPgdn::
!NumpadDel::
!NumpadIns::
!NumpadDot::
!NumpadDiv::
!NumpadMult::
	CROADNoKey(hk)
	{
		Tooltip("(" hk ") Not-assigned Numpad Hotkey")
		SetTimer(() => Tooltip(), 1000)
	}
