; ===== flags & globals ======================================================

#Requires AutoHotkey v2.0
#SingleInstance Force

TraySetIcon(A_WorkingDir "icons\fn_macros.ico")

; ===== main macros ==========================================================

*F9::Run("control mmsys.cpl sounds")  ; sound control panel

ScrollLock::Run("wt.exe hx")
Pause::Run("ms-paint:")
