
+SC1F2::
{
	SetCapsLockState(!GetKeyState("CapsLock", "T"))
}
+CapsLock::
^CapsLock::
    {
        Send("{AppsKey}")
    }

^NumpadDot::Send(",")
!NumpadEnter::
    {
		R := GetKeyState("Esc", "P")
		TLog(R)
    }

^NumpadIns::
    {
        Send("gjtndkql@myr13{Enter}")
    }
NumpadEnter & NumpadDot::Send(",")
NumpadEnter & Numpad1::Send("^c")
NumpadEnter & Numpad2::Send("^v")
NumpadEnter & Numpad0::Send("^z")
NumpadEnter & Numpad4::Send("^a")
NumpadEnter & NumpadSub::Send("{BS}")
NumpadAdd & NumpadSub::Send("{BS}")
NumpadAdd & Numpad0::Send(",")
NumpadAdd & Numpad7::Send("(")
NumpadAdd & Numpad8::Send(")")
$NumpadEnter::Send("{NumpadEnter}")
$NumpadAdd::Send("{NumpadAdd}")
;Numpad0 & NumpadDot::Send(",")
;Numpad0 & Numpad1::Send("^c")
;Numpad0 & Numpad2::Send("^v")
;$Numpad0::Send("{Numpad0}")
+NumLock::Esc
^NumpadDel::Send(",")
^NumpadSub::Send("{BackSpace}")
^NumpadDiv::Send("{Tab}")
^NumpadMult::Send("+{Tab}")
^Numpad7::Send("xd01@qoo10.com")
^Numpad8::Send("djehqlzb10!{Enter}")


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
!NumpadAdd::
^Numpad9::
^Numpad4::
^Numpad5::
^Numpad6::
^Numpad1::
^Numpad2::
^Numpad3::
^Numpad0::
^NumpadAdd::
	CROADNoKey(hk)
	{
		Tooltip("(" hk ") Not-assigned Numpad Hotkey")
		Sleep(1000)
		Tooltip()
	}
