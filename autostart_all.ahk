#Requires AutoHotkey v2

; Specify the directory path
directoryPath := "F:\install_on_ssd\New folder (2)\ahk\scripts\ahk_startup_scripts"

; Set the delay in milliseconds
delay := 1000 ; 1 second

; Initialize a counter for the number of scripts run
scriptsRun := 0

; Initialize a counter for errors
errors := 0

Loop Files, directoryPath "\*.ahk"
{
    ; Construct the full path to the script
    scriptPath := A_LoopFileFullPath

    try {
        ; Run the script using the system's file association
        Run scriptPath
        scriptsRun++
        Sleep delay ; Wait for the specified delay
    } catch Error as e {
        ; Handle any errors that occur during script execution
        errors++
        MsgBox "Error running script: " scriptPath "`nError: " e.Message
    }
}

; Display a summary
MsgBox "Scripts run: " scriptsRun "`nErrors encountered: " errors
