#Requires AutoHotkey v2.0

; ==============================
; Shortcut Reference GUI
; ==============================

global shortcuts := Map(
    "nvdia overlay", "alt + z",
    "game full screen", "alt + enter",
    "open session", "win + t",
    "task manager", "ctrl + shift + esc",
    "-- -emd -x ", "—",
    "mouse l + backward", "mini all win",
    "mouse l + forward", "ss",
    "mouse r + scroll", "vol +/-",
    "caps hold", "activate global vim layer"
)

; Create GUI
myGui := Gui("+AlwaysOnTop", "i rember💀💀")
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
