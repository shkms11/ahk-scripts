#Requires AutoHotkey v2.0

; Hotkey: Ctrl + Alt + C
^!c::
{
    ; 1. Identify all open windows
    ids := WinGetList(,, "Program Manager") 
    
    for hwnd in ids
    {
        this_title := WinGetTitle(hwnd)
        this_class := WinGetClass(hwnd)

        ; Skip system-critical items (Taskbar, Start Menu, Desktop)
        if (this_title == "" || this_class == "Shell_TrayWnd" || this_class == "WorkerW")
            continue

        ; 2. Handle File Explorer (CabinetWClass) specifically
        if (this_class == "CabinetWClass") 
        {
            ; Force the entire window (all tabs) to close gracefully
            PostMessage(0x0112, 0xF060,,, "ahk_id " hwnd)
        }
        else 
        {
            ; 3. Handle all other apps (Notepad, Chrome, etc.)
            ; WinClose triggers standard "Save" prompts
            WinClose(hwnd)
        }
        
        ; 1 second delay for safety between each app
        Sleep 1000 
    }
}
#NoTrayIcon