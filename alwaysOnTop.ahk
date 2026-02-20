#Requires AutoHotkey v2.0

^Space:: { ; Ctrl + Space
    win := WinGetTitle("A") ; Get the title of the active window
    if (win != "") { ; Ensure a window is active
        ExStyle := WinGetExStyle(win)
        if (ExStyle & 0x8) { ; Check if WS_EX_TOPMOST (Always On Top) is set
            notifMsg := win " is no longer always on top."
            notifIcon := 2 ; Warning icon
        } else {
            notifMsg := win " is now always on top."
            notifIcon := 1 ; Info icon
        }
        WinSetAlwaysOnTop -1, "A" ; Toggle Always On Top for the active window
    } else {
        notifMsg := "No window is selected."
        notifIcon := 3 ; Error icon
    }
    TrayTip notifMsg, "Always On Top", notifIcon
    Sleep 2500 ; Display notification for 2.5 seconds
    TrayTip ; Clear notification
}
