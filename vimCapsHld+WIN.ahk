#Requires AutoHotkey v2.0

; =========================================
; Ensure CapsLock starts OFF
SetCapsLockState("Off")

; =========================================
; VIM MODE (active only while holding CapsLock)
#HotIf GetKeyState("CapsLock", "P")

; Cursor movement
h::Send "{Left}"
l::Send "{Right}"

; Up / Down with optional scrolling
j::
{
    if GetKeyState("Ctrl", "P")
        Send "{WheelDown}"   ; Scroll down
    else
        Send "{Down}"        ; Arrow down
}

k::
{
    if GetKeyState("Ctrl", "P")
        Send "{WheelUp}"     ; Scroll up
    else
        Send "{Up}"          ; Arrow up
}

; Word movement
b::Send "^{Left}"    ; Back one word
w::Send "^{Right}"   ; Forward one word

; Start / End of line
0::Send "{Home}"
$::Send "{End}"

#HotIf  ; End Vim mode


; =========================================
; Block CapsLock alone (does nothing)
*CapsLock::return


; =========================================
; Win + CapsLock → Toggle real CapsLock
#CapsLock::
{
    current := GetKeyState("CapsLock", "T")
    SetCapsLockState(current ? "Off" : "On")
}

#NoTrayIcon
