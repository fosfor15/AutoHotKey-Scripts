#Requires AutoHotkey v2.0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; System information about active window
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#Z:: {
    UniqueID := WinActive("A")
    ProcessID := WinGetPID("A")
    Title := WinGetTitle(UniqueID)
    Result := !WinGetTitle(WinActive("A"))

    WinGetPos(&X, &Y, &Width, &Height, "A")

    MsgBox(
        "Title: " Title "`n"
        "UniqueID: " UniqueID "`n"
        "ProcessID: " ProcessID "`n"
        "Result: " Result "`n"
        "Position: " X ", " Y "`n"
        "Size: " Width "x" Height
    )
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Manipulation of Position and Size of active Window
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#W:: {
    Title := WinGetTitle("A")

    if (
        InStr(Title, "V***") ||
        InStr(Title, "F***") ||
        InStr(Title, "l***") ||
        InStr(Title, "P***") ||
        InStr(Title, "MT***") ||
        InStr(Title, "MWh***") ||
        InStr(Title, "PA***") 
    ) {
        WinMove(20, 112, 2520, 1470, Title)
    }
    else if (
        InStr(Title, "H***") ||
        InStr(Title, "ON***") ||
        InStr(Title, "pA***")
    ) {
        WinMove(10, 112, 2540, 1480, Title)
    }
    if (
        InStr(Title, "T***")
    ) {
        WinMove(947, 112, 1600, 1478, Title)
    }
    else if (
        InStr(Title, "ЯМ***") ||
        InStr(Title, "WA***")
    ) {
        WinMove(10, 112, 2110, 1480, Title)
    }
    else if (
        InStr(Title, "DS***")
    ) {
        WinMove(20, 112, 2100, 1470, Title)
    }
    else if (
        InStr(Title, "TG***")
    ) {
        WinMove(20, 112, 2090, 1470, Title)
    }
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Manipulation of volume
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#Left:: {
    Send "{Volume_Down}"
}

#Right:: {
    Send "{Volume_Up}"
}

#Space:: {
    Send "{Media_Play_Pause}"
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Manipulation of screen brightness
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#HotIf !WinGetTitle(WinActive("A")) || WinActive("Быстрые настройки") || WinActive("Пуск") || WinActive("Экран блокировки Windows по умолчанию")

#Up:: {
    changeBrightness(5)
}

#Down:: {
    changeBrightness(-5)
}

#HotIf


getCurrentBrightNess() {
	For property in ComObjGet( "winmgmts:\\.\root\WMI" ).ExecQuery( "SELECT * FROM WmiMonitorBrightness" )
		currentBrightness := property.CurrentBrightness	

	return currentBrightness
}

changeBrightness(brightnessDelta, timeout := 1) {
    brightness := getCurrentBrightNess() + brightnessDelta 

    For property in ComObjGet("winmgmts:\\.\root\WMI").ExecQuery("SELECT * FROM WmiMonitorBrightnessMethods")
        property.WmiSetBrightness(timeout, brightness := Max(0, Min(brightness, 100)))
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Opening of favorite and frequently used sites
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^+Y:: {
    Run "https://youtube.com"
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Keystrokes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

:*:d@:: {
    SendText "d***"
}

:*:s@:: {
    SendText "superman@mail.com"
}

:*:n@:: {
    SendText "nightman@mail.com"
}

:*:q@:: {
    SendText "qwerty"
}
