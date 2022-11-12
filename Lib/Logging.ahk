Logging_Filename := A_ScriptDir "\logfile.txt"
WLogPID := 0

if not (FileExist(Logging_Filename)){
	FileAppend("Logging starts...`n", Logging_Filename)
}


Logging_log(msg)
{
	global WLogPID
	if (WLogPID != 0 and WinExist("ahk_pid " WLogPID)) {
		WinKill("ahk_pid " WLogPID)
	}
	VDateTime := FormatTime(, "yy-MM-dd hh:mm:ss")
	FileAppend(VDateTime ": " msg "`n", Logging_Filename)
	Run("cmd.exe /K tail -f " Logging_Filename,,,&WLogPID)
}

Logging_ExitFunc(Reason, ExitCode)
{
	if (WLogPID != 0) {
		WinKill("ahk_pid " WLogPID)
	}
}

OnExit(Logging_ExitFunc)

;+F2::
;{
;	Logging_log("hello")
;}
