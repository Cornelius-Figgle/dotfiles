Set WshShell = CreateObject("WScript.Shell") 
WshShell.Run chr(34) & "c:\users\max\source\dotfiles\scripts\autostart.bat" & Chr(34), 0
Set WshShell = Nothing