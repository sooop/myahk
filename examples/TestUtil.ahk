MsgLog(msg)
{
	Tooltip(msg)
	Sleep(1000)
	Tooltip()
}

^BS::ExitApp()
^NumpadEnter::
{
	MsgLog("Reloading...")
	Reload()
}

MsgLog("Loaded.")

; Access ImmGetConversionStatus
+SC1F2::
GetImmStatus(hk)
{
	hWnd := WinGetID("A")
	ctx := DllCall("imm32\ImmGetContext", "Ptr", hWnd, "Ptr")
	MsgLog(msg)
}
