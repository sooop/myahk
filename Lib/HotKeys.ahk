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

^+[::
{
	SendInput("∘")
}

SC1F2 & Numpad0::
SC1F2 & Numpad1::
SC1F2 & Numpad2::
SC1F2 & Numpad3::
SC1F2 & Numpad4::
SC1F2 & Numpad5::
SC1F2 & Numpad6::
SC1F2 & Numpad7::
SC1F2 & Numpad8::
SC1F2 & Numpad9::
SC1F2 & y::
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
$SC1F2::Send("{SC1F2}")
SC1F2 & u::Send("{Media_Prev}")
SC1F2 & i::Send("{Media_Play_Pause}")
SC1F2 & o::Send("{Media_Next}")
SC1F2 & s::Send("{Left}")
SC1F2 & d::Send("{Down}")
SC1F2 & f::Send("{Right}")
SC1F2 & e::Send("{Up}")
SC1F2 & h::Send("{Left}")
SC1F2 & j::Send("{Down}")
SC1F2 & l::Send("{Right}")
SC1F2 & k::Send("{Up}")
SC1F2 & ,::Send("{Volume_Down}")
SC1F2 & .::Send("{Volume_Up}")
SC1F2 & /::Send("{Volume_Mute}")
SC1F2 & [::Send("{Home}")
SC1F2 & ]::Send("{End}")
SC1F2 & \::Send("{Media_Play_Pause}")

SC11D & Up::Send("{Volume_Up}")
SC11D & Down::Send("{Volume_Down}")
SC11D & Left::Send("{Media_Prev}")
SC11D & Right::Send("{Media_Next}")
SC11D & Del::Send("{Media_Play_Pause}")

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
