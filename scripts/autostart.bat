@echo off

START /B "" glazewm.exe

:: START /B "" taskkill /IM explorer.exe /F

START /B "" "%USERPROFILE%\source\dotfiles\scripts\ahk_exit.ahk"
START /B "" "%USERPROFILE%\source\dotfiles\scripts\fn_macros.ahk"
START /B "" "%USERPROFILE%\source\dotfiles\scripts\media_keys.ahk"
if %COMPUTERNAME%==NIGHTCRAWLER START /B "" "%USERPROFILE%\source\dotfiles\scripts\win_key.ahk"
