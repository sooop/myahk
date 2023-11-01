GroupAdd("GRP_PWD", "ahk_exe mstsc.exe")
GroupAdd("GRP_PWD", "ahk_exe explorer.exe")
GroupAdd("GRP_PWD", "ahk_exe firefox.exe")
GroupAdd("GRP_PWD", "ahk_exe chrome.exe")
GroupAdd("GRP_PWD", "ahk_exe msedge.exe")
GroupAdd("GRP_PWD", "ahk_exe edge.exe")
GroupAdd("GRP_PWD", "ahk_exe opera.exe")
GroupAdd("GRP_PWD", "ahk_exe CredentialUIBroker.exe")
; GroupAdd("GRP_PWD", "ahk_exe Notepad.exe")
GroupAdd("GRP_PWD", "ahk_class Credential Dialog Xaml Host")

GroupAdd("GRP_VPN", "ahk_exe nsload.exe")
GroupAdd("GRP_XD", "ahk_exe Creative Cloud.exe")
GroupAdd("GRP_XD", "Adobe XD")
GroupAdd("GRP_TVW", "ahk_exe TeamViewer.exe")

#HotIf WinActive("ahk_group GRP_PWD")
^+BS::
	EnterPassword(hk)
	{
		Send("^a")
		Send("{text}rmfkepdltus@myR12")
		Send("{Enter}")
	}

#HotIf WinActive("ahk_group GRP_XD")
^+BS::
{
	Send("^a")
	Send("{text}djehqlzb10")
	Send("{!}{Enter}")
}

#HotIf WinActive("ahk_group GRP_TVW")
^+BS::
{
	Send("^a")
	Send("{text}zQaAkRfp4#a8#FY")
	Send("{!}{Enter}")
}

#HotIf WinActive("ahk_group GRP_VPN")
^+BS::
{
	Send("^a")
	Send("{text}rmfkepdltus@myR12")
	Send("{tab}")
}
#HotIf
