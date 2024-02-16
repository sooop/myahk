GroupAdd("GRP_BROWSER", "ahk_exe firefox.exe")
GroupAdd("GRP_BROWSER", "ahk_exe chrome.exe")
GroupAdd("GRP_BROWSER", "ahk_exe edge.exe")
GroupAdd("GRP_BROWSER", "ahk_exe opera.exe")

GroupAdd("GRP_WORDP", "ahk_exe word.exe")
GroupAdd("GRP_WORDP", "ahk_exe notepad.exe")
GroupAdd("GRP_WORDP", "ahk_exe wordpad.exe")

TLog(msg)
{
	Tooltip(msg)
	SetTimer(() => Tooltip())
}
