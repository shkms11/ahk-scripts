#Requires AutoHotkey v2.0

; ==============================
; Shortcut Reference GUI
; ==============================

global shortcuts := Map(
    "Game Side Bar", "Alt + Z",
    "Open Apps", "Win + T",
    "Task Manager", "Ctrl + Shift + Esc",
    "Separator", "—",
    "Mouse Left + Backward", "Mini All Window",
    "Mouse L + Forward", "SS",
    "Mouse R + Scroll", "Vol +/-",
    "Vim Caps Hold + Win", "Vim Arrow & Navigation"
)

; Create GUI
myGui := Gui("+AlwaysOnTop", "Shortcut Reference")
myGui.SetFont("s10", "Segoe UI")

; Add a neat table of shortcuts
y := 10
for name, combo in shortcuts
{
    if (name = "Separator")
    {
        myGui.AddText("x10 y" y " w250 h20", combo)
    }
    else
    {
        myGui.AddText("x10 y" y " w150 h20", name)
        myGui.AddText("x170 y" y " w150 h20", combo)
    }
    y += 25
}

; Show GUI
myGui.Show()

; Hotkey to open GUI anytime
^!m::  ; Ctrl + Alt + M
{
    myGui.Show()
}
