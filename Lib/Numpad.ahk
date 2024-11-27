
;+SC1F2::
;{
;	SetCapsLockState(!GetKeyState("CapsLock", "T"))
;}
!NumpadEnter::
    {
		TLog(IMECheckHangul() ? "Hangul" : "English")
    }

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
		SetTimer(() => Tooltip(), -2000)
	}
