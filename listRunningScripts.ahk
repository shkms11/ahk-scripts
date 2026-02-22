#Requires AutoHotkey v2.0
Persistent  ; Keeps it running in background

myGui := Gui("+AlwaysOnTop", "Running AHK Scripts")
myGui.Add("Text", , "Currently running AHK scripts:")
listBox := myGui.Add("ListBox", "r15 w300 vScripts")
myGui.Add("Button", "w80", "Refresh").OnEvent("Click", (*) => RefreshList())
myGui.Add("Button", "x+m w80", "Minimize").OnEvent("Click", (*) => myGui.Hide())
myGui.OnEvent("Close", (*) => myGui.Hide())  ; X button hides to tray

myGui.Show()
RefreshList()  ; Shows list immediately like your original

RefreshList() {
    DetectHiddenWindows(true)
    ids := WinGetList("ahk_class AutoHotkey")
    
    listBox.Delete()
    
    if (ids.Length = 0) {
        listBox.Add(["No scripts found"])
        return
    }
    
    scripts := []
    for id in ids {
        title := WinGetTitle("ahk_id " id)
        if (InStr(title, " - AutoHotkey v")) {
            scriptName := RegExReplace(title, " - AutoHotkey v\d+\.\d+\.\d+$")
            SplitPath(scriptName, , , , &name)
            if (name && name != A_ScriptName) {
                duplicate := false
                for script in scripts {
                    if (script = name) {
                        duplicate := true
                        break
                    }
                }
                if (!duplicate)
                    scripts.Push(name)
            }
        }
    }
    
    for script in scripts {
        listBox.Add([script])
    }
    if (scripts.Length = 0)
        listBox.Add(["No other scripts running"])
}

