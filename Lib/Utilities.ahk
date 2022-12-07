#HotIf WinActive("ahk_exe explorer.exe")
#t::
	ToggleHiddenExt(hk)
	{
		RootKey := "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
		KeyName := "HideFileExt"
		value := RegRead(RootKey, KeyName)
		newValue := value ? 0 : 1
		RegWrite(newValue, "REG_DWORD", RootKey, KeyName)
		Send("{F5}")
	}
#y::
	ToggleHiddenFile(hk)
	{
		RootKey := "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
		KeyName := "Hidden"
		value := RegRead(RootKey, KeyName)
		 newValue := (value == 2) ? 1 : 2
		 RegWrite(newValue, "REG_DWORD", RootKey, KeyName)
		 Send("{F5}")
	}
#HotIf
$F2::
	HoldToCapsLock(hk)
	{
		theKey := SubStr(hk, 2)
		try {
				if (KeyWait(theKey, "T0.3") == 1)
				{
					Send("{" theKey "}")
				} else if (A_TimeSincePriorHotkey > 290)
				{
					SetCapsLockState(!GetKeyState("CapsLock", "T"))
				}
		} catch Error as err {
			send("{" theKey "}")
		}
		if IMECheckHangul() {
			Send("{SC1F2}")
		}
	}

TLog(msg)
{
	Tooltip(msg)
	Sleep(1000)
	Tooltip()
}
