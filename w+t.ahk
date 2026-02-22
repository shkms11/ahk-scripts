#Requires AutoHotkey v2.0

#t::
{
    OpenOrActivate("ahk_exe WindowsTerminal.exe", "wt.exe")
    OpenOrActivate("ahk_exe Notion.exe", "F:\portal__\Notion.lnk")
    OpenOrActivate("ahk_exe vivaldi.exe", "F:\portal__\vivaldi - Shortcut.lnk")
}

OpenOrActivate(winTitle, runPath)
{
    if WinExist(winTitle)
    {
        WinActivate
    }
    else
    {
        Run runPath
    }
}

#NoTrayIcon
