#Requires AutoHotkey v2.0

; When holding Left Mouse Button and pressing Back (XButton1)
~LButton & XButton1::
{
    Send "#d"   ; Win + D to minimize all / show desktop
}

#NoTrayIcon 
