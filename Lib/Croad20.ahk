+SC1F2::
{
	SetCapsLockState(!GetKeyState("CapsLock", "T"))
}
+CapsLock::
^CapsLock::
    {
        Send("{AppsKey}")
    }

>^NumpadDot::
^NumpadDot::Send(",")
!NumpadEnter::
    {
        TN := Tooltip("numpad enter")
        Sleep 1000
        Tooltip
    }

^NumpadIns::
    {
        Send("gjtndkql@myr13{Enter}")
    }
+NumLock::Send("{Escape}")
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
