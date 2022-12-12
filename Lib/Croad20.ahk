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
$NumpadDot::
	{
		if (GetKeyState("Esc", "P")) {
			Send(",")
		} else {
			Send("{NumpadDot}")
		}
	}
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
$NumpadEnter::Send("{NumpadEnter}")
;Numpad0 & NumpadDot::Send(",")
;Numpad0 & Numpad1::Send("^z")
;Numpad0 & Numpad2::Send("^c")
;Numpad0 & Numpad3::Send("^v")
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
