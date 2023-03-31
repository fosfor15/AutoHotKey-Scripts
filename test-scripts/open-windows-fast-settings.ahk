#Requires AutoHotkey v2.0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Opening Windows fast settings for adjusting a screen brightness
; In test
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

openFastSettings() {
    static isFastSettingsOpened := False

    if isFastSettingsOpened = False {
        Send "#a"
        isFastSettingsOpened := True
    }

    value := KeyWait("#", "T1")
    MsgBox value

    ; if !KeyWait("#", "T1") {
    ;     Send "{Escape}"
    ;     isFastSettingsOpened := False
    ; }
}