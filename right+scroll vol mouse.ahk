#Requires AutoHotkey v2.0

; Scroll Wheel Up while holding Right Mouse → Volume Up
#HotIf GetKeyState("RButton", "P")
WheelUp::Send("{Volume_Up}")

; Scroll Wheel Down while holding Right Mouse → Volume Down
WheelDown::Send("{Volume_Down}")
#HotIf

#NoTrayIcon
