#Requires AutoHotkey v2.0

; Hotkeys

#n:: {
    Run "notepad.exe"
    WinWait "Untitled - Notepad"
    WinActivate "Untitled - Notepad"
    WinMove 0, 0, A_ScreenWidth/4, A_ScreenHeight/2, "Untitled - Notepad"
}

<^Left::    MoveActiveWindowBy(-10,   0)
<^Right::   MoveActiveWindowBy(+10,   0)
<^Up::      MoveActiveWindowBy(  0, -10)
<^Down::    MoveActiveWindowBy(  0, +10)

MoveActiveWindowBy(x, y) {
    WinExist "A"  ; Make the active window the Last Found Window  
    WinGetPos &current_x, &current_y
    WinMove current_x + x, current_y + y
}

#Right:: {
    SoundSetVolume "+5"
}

#Left:: {
    SoundSetVolume "-5"
}

^M:: {
    WinMaximize "A"
}

#i::
{
    Run "https://www.google.com/"
}

^b::  ; CTRL+B hotkey
{
    Send "{Ctrl down}c{Ctrl up}"  ; Copies the selected text. ^c could be used as well, but this method is more secure.
    SendInput "[b]{Ctrl down}v{Ctrl up}[/b]" ; Wraps the selected text in BBCode tags to make it bold in a forum.
}

Text := "Text"
Num := 2
Text := "The value of 5 + " Num " is: " 5 + Num

^i:: {
    MsgBox Text
}

; Hotstrings

::ftw::Free the whales
::btw::by the way
; :*:btw::by the way

; Functions
/* GetWindowInfo()
{
    SysGet MonitorCount
    MsgBox %MonitorCount%
    SysGet Monitor
    MsgBox Left %MonitorLeft% -- Top %MonitorTop% -- Right %MonitorRight% -- Bottom %MonitorBottom%
}

; Get params of the screens
!p::
{
    GetWindowInfo()
} 
*/

^j::
{
    MsgBox "Wow!"
    MsgBox "There are"
    Run "notepad.exe"
    WinActivate "Untitled - Notepad"
    WinWaitActive "Untitled - Notepad"
    Send "7 lines{!}{Enter}"
    SendInput "inside the CTRL{+}J hotkey."
}
○○