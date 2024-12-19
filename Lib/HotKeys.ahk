#SingleInstance Force
;
; for AHK v2

; simple hot key
; hot key ends with "::"
; hot key modifiers
; - ^ : ctrl
; - # : win
; - + : shift
; - ! : alt
; hot key options
; - $ : use when Send same key in hotkey action
; - ~ : do not block hotkey's original behavior

; SC1F2 : Hangul
; SC1F1 : Hanja

; HotString Options
; * : Ending character not required.
; ? : Triggered even if it is inside other word.
; B0: No auto-backspace
; Kn: Key delay
; o : omit ending character


F15 & h::Send("{Left}")
F15 & j::Send("{Down}")
F15 & l::Send("{Right}")
F15 & k::Send("{Up}")
F15 & u::Send("{Ctrl Down}{Home}{Ctrl Up}")
F15 & i::Send("{Ctrl Down}{End}{Ctrl Up}")
F15 & n::Send("{Pgup}")
F15 & m::Send("{Pgdn}")
F15 & ,::Send("·")
F15 & .::Send("•")
F15 & `;::Send("∴")
F15 & 8::Send("×")
F15 & /::Send("÷")
F15 & [::Send("{Home}")
F15 & ]::Send("{End}")
F15 & Space::Send("{SC1F2}")
F15 & Enter::Send("{SC1F1}")
F15 & Backspace::Send("{Del}")
F15 & Del::Send("{Backspace}")
F15 & Up::Send("{Pgup}")
F15 & Down::Send("{Pgdn}")
F15 & Left::Send("{Home}")
F15 & Right::Send("{End}")
F15 & F8::Send("{Media_Next}")
F15 & F7::Send("{Media_Prev}")
F15 & F6::Send("{Media_Stop}")
F15 & F5::Send("{Media_Pause}")
F15 & F10::Send("{Volume_Down}")
F15 & F11::Send("{Volume_Up}")
F15 & F12::Send("{Volume_Mute}")
F16::Send("·")
F17::Send("∙")
F15 & =::Send("{Shift down}{End}{Shift up}")
F15 & -::Send("{Shift down}{Home}{Shift up}")
F15 & 9::Send("{Shift down}{Ctrl Down}{Home}{Ctrl Up}{Shift up}")
F15 & 0::Send("{Shift down}{Ctrl Down}{End}{Ctrl Up}{Shift up}")
F15 & Numpad4::Send("{Shift down}{Left}{Shift up}")
F15 & Numpad6::Send("{Shift down}{Right}{Shift up}")
F15 & Numpad8::Send("{Shift down}{Up}{Shift up}")
F15 & Numpad2::Send("{Shift down}{Down}{Shift up}")
F15 & Numpad7::Send("{Shift down}{Home}{Shift up}")
F15 & Numpad1::Send("{Shift down}{End}{Shift up}")
F15 & Numpad9::Send("{Shift down}{Pgup}{Shift up}")
F15 & Numpad3::Send("{Shift down}{Pgdn}{Shift up}")



#HotIf GetKeyState("ScrollLock", "T") == 1
+Esc::Send("``")
<+Esc::Send("``")
$Space::
{
	;if WinActive("ahk_group GRP_WORDP") and
		;A_PriorHotkey == ThisHotkey and
	if A_PriorHotkey == ThisHotkey and
		A_TimeSincePriorHotkey < 200 {
		Send("{BS}{Enter}")
	} else {
		Send("{Space}")
	}
}
!F8::Send("{Media_Next}")
^+.::
{
	;SendInput("https://www.smtownandstore.com/")
	SendInput("∙")
}

^+,::
{
	;SendInput("https://www.smtownandstore.com/")
	SendInput("…")
}

;^+]::
;{
	;;SendInput("https://www.smtownandstore.com/")
	;SendInput("responsibility@smtown.com")
;}


SC1F1 & Numpad0::
SC1F1 & Numpad1::
SC1F1 & Numpad2::
SC1F1 & Numpad3::
SC1F1 & Numpad4::
SC1F1 & Numpad5::
SC1F1 & Numpad6::
SC1F1 & Numpad7::
SC1F1 & Numpad8::
SC1F1 & Numpad9::
SC1F1 & y::
{
	nn := String(Random(9))
	Send(nn)
}




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

F15 & F9::
$F9::
{
	KeyWait("F9")
	if(KeyWait("F9", "DT0.3") == 1) {
		WinCur := WinGetID("A")
		winname := "ahk_exe Spotify.exe"
		DetectHiddenWindows 1
		try {
			mn := WinGetMinMax(winname)
			; TLog(mn)
			if mn != 1 {
				WinRestore(winname)
			}
			WinActivate(winname)
			Sleep(300)
			Send("+!b")
			Sleep(1000)
			WinActivate("ahk_id " . WinCur)
		} catch {
			MsgBox("Spotify is not running.")
		}
	} else {
		Send("{F9}")
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
		Send("{Volume_Mute}")
	} else {
		Send("{F12}")
	}
}
