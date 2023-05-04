GroupAdd("GRP_BROWSER", "ahk_exe firefox.exe")
GroupAdd("GRP_BROWSER", "ahk_exe chrome.exe")
GroupAdd("GRP_BROWSER", "ahk_exe edge.exe")
GroupAdd("GRP_BROWSER", "ahk_exe opera.exe")
GroupAdd("GRP_BROWSER", "ahk_exe notepad.exe")

GroupAdd("GRP_WORDP", "ahk_exe word.exe")
GroupAdd("GRP_WORDP", "ahk_exe notepad.exe")
GroupAdd("GRP_WORDP", "ahk_exe wordpad.exe")

#HotIf GetKeyState("ScrollLock", "T") ==  1
$Space::
{
	if WinActive("ahk_group GRP_WORDP") and
		A_PriorHotkey == ThisHotkey and
		A_TimeSincePriorHotkey < 200 {
		Send("{BS}{Enter}")
	} else {
		Send("{Space}")
	}
}

<+Esc::Send("``")


#HotIf GetKeyState("NumLock", "T") == 0

^+LButton::
{
	Send("{Shift DownR}{Shift Up}{LButton 3}^c")
}


^+RButton::
{
	Send("^a^v")
}

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
; SC11D = RCtrl
$SC11D:: {
	if (KeyWait("SC11D", "T0.3") == 1) {
		Send("{SC11D}")
	} else {
		SetCapsLockState(!GetKeyState("CapsLock", "T"))
	}
}

>+Esc::Send("~")

$F1::
{
	KeyWait("F1")
	if(KeyWait("F1", "DT0.3") == 1) {
		SetNumLockState(!GetKeyState("NumLock", "T"))
	} else {
		Send("{F1}")
	}
}

$F2::
{
	KeyWait("F2")
	if(KeyWait("F2", "DT0.3") == 1) {
		SetCapsLockState(!GetKeyState("CapsLock", "T"))
	} else {
		Send("{F2}")
	}
}

$F4::
{
	KeyWait("F4")
	if(KeyWait("F4", "DT0.3") == 1) {
		SetScrollLockState(!GetKeyState("ScrollLock", "T"))
	} else {
		Send("{F4}")
	}
}

$F10::
{
	KeyWait("F10")
	if(KeyWait("F10", "DT0.3") == 1) {
		Send("{Volume_Down}")
	} else {
		Send("{F10}")
	}
}

$F11::
{
	KeyWait("F11")
	if(KeyWait("F11", "DT0.3") == 1) {
		Send("{Volume_Up}")
	} else {
		Send("{F11}")
	}
}

$F12::
{
	KeyWait("F12")
	if(KeyWait("F12", "DT0.3") == 1) {
		Send("${Volume_Mute}")
	} else {
		Send("{F12}")
	}
}



TLog(msg)
{
	Tooltip(msg)
	Sleep(1000)
	Tooltip()
}
