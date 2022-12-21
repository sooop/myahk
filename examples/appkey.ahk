; AppsKey - context menu key.
; being replaced with CapsLock.
; shift + Capslock -> AppsKey
#Include "TestUtil.ahk"

+CapsLock::Send("{Blind}{AppsKey}")
; But CapsLock key is not blocked.
