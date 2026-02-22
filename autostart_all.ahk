

#Requires AutoHotkey v2

; Specify the directory path
directoryPath := "F:\\install_on_ssd\\New folder (2)\\ahk\\scripts\\ahk_startup_scripts"

; Set the delay in milliseconds
delay := 1000 ; 1 second

; Initialize arrays to track scripts and errors
scriptsRun := []
errors := []

Loop Files, directoryPath "\\*.ahk"
{
    ; Get just the filename for display
    SplitPath A_LoopFileFullPath, &scriptName
    
    ; Construct the full path to the script
    scriptPath := A_LoopFileFullPath

    try {
        ; Run the script using the system's file association
        Run scriptPath
        scriptsRun.Push(scriptName)  ; Store successful script name
        Sleep delay ; Wait for the specified delay
    } catch {
        ; Store error details - don't capture Error object directly
        errors.Push(scriptName . ": Failed to run")
    }
}

; Build the summary message with counts
summary := "Summary:`n`n"
summary .= "✅ Scripts run successfully: " scriptsRun.Length "`n"
if (scriptsRun.Length > 0) {
    summary .= "List:`n"
    Loop scriptsRun.Length {
        summary .= "- " scriptsRun[A_Index] "`n"
    }
}

summary .= "`n❌ Errors encountered: " errors.Length "`n"
if (errors.Length > 0) {
    summary .= "List:`n"
    Loop errors.Length {
        summary .= "- " errors[A_Index] "`n"
    }
}

; Display a detailed summary
MsgBox summary
