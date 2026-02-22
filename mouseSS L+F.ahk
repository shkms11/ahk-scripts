#Requires AutoHotkey v2.0

; When holding Left Mouse Button and pressing Forward (XButton1)
~LButton & XButton2::
{
    Send "#+s"   ; Win + Shift + S
}

#NoTrayIcon 
