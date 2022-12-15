GroupAdd("GRP_BROWSER", "ahk_exe firefox.exe")
GroupAdd("GRP_BROWSER", "ahk_exe chrome.exe")
GroupAdd("GRP_BROWSER", "ahk_exe edge.exe")
GroupAdd("GRP_BROWSER", "ahk_exe opera.exe")
GroupAdd("GRP_BROWSER", "ahk_exe notepad.exe")

#HotIf WinActive("ahk_group GRP_BROWSER")
$Esc::
{
	KeyWait("Esc")
	if (KeyWait("Esc", "DT0.2") == 1) {
		Send("^{Home}")
	} else {
		Send("{Esc}")
	}
}

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
;$SC138::
$F2::
	HoldToCapsLock(hk)
	{
		threash := 0.27
		theKey := SubStr(hk, 2)
		res := KeyWait(theKey, "T" threash)
		if res == 0 {
			if A_TimeSinceThisHotKey > threash  {
				SetCapsLockState(!GetKeyState("CapsLock", "T"))
				return
			}
		}

		Send("{" theKey "}")
	}

TLog(msg)
{
	Tooltip(msg)
	Sleep(1000)
	Tooltip()
}
