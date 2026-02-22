#Requires AutoHotkey v2.0

; ==============================
; Shortcut Helper GUI
; ==============================

global shortcuts := Map(
    "Copy (Ctrl+C)", "^c",
    "Paste (Ctrl+V)", "^v",
    "Cut (Ctrl+X)", "^x",
    "Save (Ctrl+S)", "^s",
    "Undo (Ctrl+Z)", "^z",
    "Redo (Ctrl+Y)", "^y",
    "Select All (Ctrl+A)", "^a",
    "Find (Ctrl+F)", "^f",
    "Switch App (Alt+Tab)", "!{Tab}",
    "Close Window (Alt+F4)", "!{F4}"
)

; ==============================
; Create GUI
; ==============================

myGui := Gui("+AlwaysOnTop", "Shortcut Helper")
myGui.SetFont("s10", "Segoe UI")

for label, keys in shortcuts
{
    btn := myGui.AddButton("w220 h30", label)
    btn.OnEvent("Click", SendShortcut.Bind(keys))
}

myGui.Show()

; ==============================
; Send Shortcut Function
; ==============================

SendShortcut(keys, *)
{
    Send(keys)
}

; ==============================
; Hotkey to open GUI
; ==============================
^!m::  ; Ctrl + Alt + M
{
    myGui.Show()
}

#NoTrayIcon
