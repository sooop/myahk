Esc::ExitApp()

!#t::
	MoveTaskBar(hk)
	{
		RootKey := "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3"
		KeyName := "Settings"
		value := RegRead(RootKey, KeyName)
		x := SubStr(value, 1, 2)
		MsgBox(x)
		newValue := SubStr(value, 1, 24) . (x == "03" ? "XX" : "03") . SubStr(value, 27)
		MsgBox(value . "`n" . newValue)
		RegWrite(newValue, "REG_BINARY", RootKey, KeyName)
		try {
			ProcessClose("explorer.exe")
				Run("explorer.exe")
		} catch {
			MsgBox("Restart explorer manually.")
		}
	}
