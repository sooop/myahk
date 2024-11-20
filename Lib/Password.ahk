GroupAdd("GRP_PWD", "ahk_exe mstsc.exe")
GroupAdd("GRP_PWD", "ahk_exe explorer.exe")
GroupAdd("GRP_PWD", "ahk_exe firefox.exe")
GroupAdd("GRP_PWD", "ahk_exe chrome.exe")
GroupAdd("GRP_PWD", "ahk_exe msedge.exe")
GroupAdd("GRP_PWD", "ahk_exe edge.exe")
GroupAdd("GRP_PWD", "ahk_exe opera.exe")
GroupAdd("GRP_PWD", "ahk_exe Qpost.exe")
GroupAdd("GRP_PWD", "ahk_exe CredentialUIBroker.exe")
; GroupAdd("GRP_PWD", "ahk_exe Notepad.exe")
GroupAdd("GRP_PWD", "ahk_class Credential Dialog Xaml Host")

GroupAdd("GRP_VPN", "ahk_exe nsload.exe")
GroupAdd("GRP_XD", "ahk_exe Creative Cloud.exe")
GroupAdd("GRP_XD", "Adobe XD")
GroupAdd("GRP_TVW", "ahk_exe TeamViewer.exe")

PWD_TEST := "helloworl!d!"
PWD_GRP_PWD := "rjqnrdli@myR23"
PWD_GRP_XD := "djehqlzb10!"
PWD_GRP_TVW := "rjqnrdli@myR23"

#HotIf WinActive("ahk_group GRP_PWD")
^+BS::
	EnterPassword(hk)
	{
		Send("^a")
		Send("{text}" . PWD_GRP_PWD)
		Send("{Enter}")
	}

#HotIf WinActive("ahk_group GRP_XD")
^+BS::
{
	Send("^a")
	Send("{text}" . PWD_GRP_XD)
	Send("{Enter}")
}

#HotIf WinActive("ahk_group GRP_TVW")
^+BS::
{
	Send("^a")
	Send("{text}" . PWD_GRP_TVW)
	Send("{Enter}")
}

#HotIf WinActive("ahk_group GRP_VPN")
^+BS::
{
	Send("^a")
	Send("{text}" . PWD_GRP_PWD)
	Send("{tab}")
}
#HotIf
^+\::{
	SendInput(PWD_GRP_PWD)
	;Send("{text}" . PWD_GRP_PWD)
	Send("{Enter}")
}
