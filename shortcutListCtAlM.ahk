#Requires AutoHotkey v2.0

; ==============================
; Shortcut Reference GUI
; ==============================

global shortcuts := Map(
    "game siderbar", "Alt + Z",
    "Open apps", "Win + T"
)

; Create GUI
myGui := Gui("+AlwaysOnTop", "Shortcut Reference")
myGui.SetFont("s10", "Segoe UI")

; Add a simple list of shortcuts
y := 10
for name, combo in shortcuts
{
    myGui.AddText("x10 y" y " w250 h20", name ": " combo)
    y += 25
}

; Show GUI
myGui.Show()

; Hotkey to open GUI anytime
^!m::  ; Ctrl + Alt + M
{
    myGui.Show()
}

#NoTrayIcon
