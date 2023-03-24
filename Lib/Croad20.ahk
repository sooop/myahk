
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

NumpadEnter & NumpadDot::Send(",")
NumpadEnter & NumpadSub::Send("{BS}")
NumpadAdd & NumpadSub::Send("{BS}")
NumpadAdd & Numpad0::Send("{Space}")
NumpadAdd & Numpad7::Send("(")
NumpadAdd & Numpad8::Send("{^}")
NumpadAdd & Numpad9::Send(")")
NumpadAdd & Numpad4::Send("<")
NumpadAdd & Numpad5::Send("=")
NumpadAdd & Numpad6::Send(">")
NumpadAdd & Numpad1::Send("[")
NumpadAdd & Numpad2::Send("{!}")
NumpadAdd & Numpad3::Send("]")
$NumpadEnter::Send("{NumpadEnter}")
$NumpadAdd::Send("{NumpadAdd}")
;Numpad0 & NumpadDot::Send(",")
;Numpad0 & Numpad1::Send("^c")
;Numpad0 & Numpad2::Send("^v")
;$Numpad0::Send("{Numpad0}")
+NumLock::Esc
^NumpadDot::Send(",")
^NumpadSub::Send("{BackSpace}")
^NumpadDiv::Send("{Tab}")
^NumpadMult::Send("+{Tab}")
^Numpad7::Send("(")
^Numpad8::Send("{^}")
^Numpad9::Send(")")
^Numpad6::Send(">")
^Numpad5::Send("=")
^Numpad4::Send("<")
^Numpad1::Send("[")
^Numpad2::Send("{!}")
^Numpad3::Send("]")
^NumpadAdd::Send(":")
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
		Sleep(1000)
		Tooltip()
	}
