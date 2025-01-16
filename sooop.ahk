; AutoHotkey V2
#SingleInstance Force


#Include <Utilities>
#Include <HotKeys>
#Include <HotStrings>
#Include <Numpad>
#Include <Password>
#Include <MouseSpeed>
;#Include <IME>

#h::TLog("Win + H is not allowed befause it occurs IME clitch.")
^+q::
	{
		TLog("Reload...")
		Reload()
	}


Browser_Back::
Browser_Forward::
Browser_Refresh::
Browser_Search::
Browser_Favorites::
Browser_Home::
;Volume_Mute::
;Volume_Down::
;Volume_Up::
;Media_Next::
;Media_Prev::
;Media_Stop::
;Media_Play_Pause::
Launch_Mail::
Launch_Media::
Launch_App1::
Launch_App2::
	UXMeidaKey(hk) {
		TLog("Disabled> " hk)
	}
TLog("Loaded.")
