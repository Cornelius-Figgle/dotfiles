; ===== flags & globals ======================================================

#Requires AutoHotkey v2.0
#SingleInstance Force

TraySetIcon(A_WorkingDir "icons\win_key.ico")

; ===== capslock -> super ===================================================

#\::DllCall("LockWorkStation")  ; allows us to `Win+l` without being blocked by system

*Capslock::Send "{LWin down}"
*Capslock Up::Send "{LWin up}"

Ins::AppsKey  ; context menus (use `mod+Ins` for normal insert)
