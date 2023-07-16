; ===== flags & globals ======================================================

#Requires AutoHotkey v2.0
#SingleInstance Force

TraySetIcon(A_WorkingDir . "icons\ahk_exit.ico")

; ===== main func ============================================================

AHKPanic(ShouldKill:=1, ShouldPause:=0, ShouldSuspend:=0, ShouldSelfToo:=1) {
    DetectHiddenWindows(true)

    IDList := WinGetList("ahk_class AutoHotkey")
    
    Loop IDList.Length {
        ID := IDList[A_Index]
        ATitle := WinGetTitle("ahk_id" . ID)

        If !InStr(ATitle, A_ScriptFullPath) {
			If ShouldSuspend
				PostMessage(0x111, 65404, , , "ahk_id" . ID)  ; Suspend
			If ShouldPause
				PostMessage(0x111, 65403, , , "ahk_id" . ID)  ; Pause
			If ShouldKill
				WinClose("ahk_id" . ID)  ; Kill
		}
    }
    If ShouldSelfToo {
        If ShouldSuspend
        	Suspend(-1)  ; Suspend
        If ShouldPause
        	Pause(-1)  ; Pause
        If ShouldKill
        	ExitApp  ; Kill
    }
}

; ===== hotkeys for func =====================================================

~RButton & ~XButton1::
+Esc::AHKPanic(1, 0, 0, 1)
