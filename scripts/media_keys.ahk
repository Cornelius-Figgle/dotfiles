; ===== flags & globals ======================================================

#Requires AutoHotkey v2.0
#SingleInstance Force

TraySetIcon(A_WorkingDir "icons\media_keys.ico")

; ===== numpad -> media keys =================================================

NumpadHome::Volume_Down
NumpadLeft::Media_Prev
NumpadEnd::Browser_Back
NumpadUp::Volume_Mute
NumpadClear::Media_Play_Pause
NumpadDown::Media_Stop
NumpadPgUp::Volume_Up
NumpadRight::Media_Next
NumpadPgDn::Browser_Forward
NumpadIns::Browser_Home
NumPadDel::Return
