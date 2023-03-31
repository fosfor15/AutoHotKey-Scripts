#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; Set position & size of the active window
!w::
SysGet, Monitor, Monitor
SysGet, MonitorWorkArea, MonitorWorkArea
WinGetActiveTitle, Title

if (MonitorRight = 1920) {
    if (InStr(Title, "Visual Studio Code") || InStr(Title, "Binance") || InStr(Title, "Huobi") || InStr(Title, "Figma")) {
        WinMove, %Title%,, 50, 55, 1820, 1000
    } else if (InStr(Title, "Яндекс.Музыка") || InStr(Title, "YouTube Music")) {
        WinMove, %Title%,, -7, MonitorWorkAreaTop, 1175, MonitorWorkAreaBottom - MonitorWorkAreaTop + 7
    } else {
        WinMove, %Title%,, 0, MonitorWorkAreaTop, 1482, MonitorWorkAreaBottom - MonitorWorkAreaTop
    }
} else if (MonitorRight = 1366) {
    if (InStr(Title, "Visual Studio Code") || InStr(Title, "Binance") || InStr(Title, "Huobi") || InStr(Title, "Figma")) {
        WinMaximize , %Title%
    } else if (InStr(Title, "Яндекс.Музыка") || InStr(Title, "YouTube Music")) {
        WinMove, %Title%,, -7, MonitorWorkAreaTop, 1175, MonitorWorkAreaBottom - MonitorWorkAreaTop + 7
    } else {
        WinMove, %Title%,, 0, MonitorWorkAreaTop, 1154, MonitorWorkAreaBottom - MonitorWorkAreaTop
    }
}

; MsgBox, %Title%
; WinGetPos, X, Y, Width, Height, A
; MsgBox, %X%`,%Y%`,%Width%`,%Height%
return


; Minimaze & Restore
!q::
WinGetActiveTitle, Title
WinGet, isMin, MinMax, %Title%
; MsgBox, %isMin%
if (isMin = 0) {
    WinMinimize, %Title%
} else if (isMin = -1) {
    WinRestore, %Title%
}
return


; Always-on-Top
#Space::
Winset, AlwaysOnTop, Toggle, A
return


; Get params of the screens
!p::
SysGet, MonitorCount, MonitorCount
MsgBox, %MonitorCount%
SysGet, Monitor, Monitor,
MsgBox, Left: %MonitorLeft% -- Top: %MonitorTop% -- Right: %MonitorRight% -- Bottom %MonitorBottom%.
return
