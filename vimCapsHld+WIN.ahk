#Requires AutoHotkey v2.0

; =========================================
; Ensure CapsLock starts off
SetCapsLockState("Off")

; =========================================
; VIM-MODE + scrolling active while holding CapsLock + another key
#HotIf GetKeyState("CapsLock", "P")

; Arrow keys for cursor movement
h::Send "{Left}"
l::Send "{Right}"

; Scroll with j/k
j::Send "{WheelDown}"   ; scroll down
k::Send "{WheelUp}"     ; scroll up

; Word movement
b::Send "^{Left}"       ; back word
w::Send "^{Right}"      ; forward word

; Start / End of line
0::Send "{Home}"
$::Send "{End}"

#HotIf  ; End Vim-mode

; =========================================
; Block CapsLock alone → does nothing
*CapsLock::return

; =========================================
; Win + CapsLock → toggle system CapsLock
#CapsLock::  ; Win + CapsLock
{
    current := GetKeyState("CapsLock", "T")  ; True = On
    SetCapsLockState(current ? "Off" : "On") ; Toggle
    return
}
