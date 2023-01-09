GroupAdd("GRP_PWD", "ahk_exe mstsc.exe")
GroupAdd("GRP_PWD", "ahk_exe explorer.exe")
GroupAdd("GRP_PWD", "ahk_exe nsload.exe")
GroupAdd("GRP_PWD", "ahk_exe firefox.exe")
GroupAdd("GRP_PWD", "ahk_exe chrome.exe")
GroupAdd("GRP_PWD", "ahk_exe msedge.exe")
GroupAdd("GRP_PWD", "ahk_exe edge.exe")
GroupAdd("GRP_PWD", "ahk_exe opera.exe")
GroupAdd("GRP_PWD", "ahk_exe CredentialUIBroker.exe")
GroupAdd("GRP_PWD", "ahk_exe Notepad.exe")
GroupAdd("GRP_PWD", "ahk_class Credential Dialog Xaml Host")

#HotIf WinActive("ahk_group GRP_PWD")
^+BS::
^F12::
^NumpadEnter::
	EnterPassword(hk)
	{
		Send("^a")
		Send("gjtndkql@myR12{Enter}")
	}
#HotIf
