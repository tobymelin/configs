#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode 2

;%A_ScreenWidth%
SysGet, Mon1, MonitorWorkArea
SysGet, Mon1F, Monitor
FullHeight:=Mon1Bottom + 10
WThird:=Mon1FRight / 3
WTwoThird:=Mon1FRight * 2 / 3

title_spotify:="ahk_exe Spotify.exe"


!x::Media_Play_Pause
!+x::Volume_Mute
!v::Media_Next
!+v::Media_Prev

^+x::
KeyWait Control
KeyWait Shift
Send {Delete}
return

!WheelUp::Send {PgUp}
!WheelDown::Send {PgDn}

!r::Run "cmd.exe"
!g::Run "C:\Users\tobias.melin\AppData\Local\Programs\Git\git-cmd.exe" --cd-to-home
!+3::Run "C:\Windows\System32\SnippingTool.exe"
!+t::Run "C:\Windows\System32\charmap.exe"
;!e::Run "C:\Program Files (x86)\Microsoft Office\root\Office16\OUTLOOK.EXE"

LAlt & j::AltTab
LAlt & k::ShiftAltTab

!+c::Send !{F4}
!m::WinMinimize A
!w::WinMinimize A
!3::Send £
![::Send å
!'::Send ä
!;::Send ö
!+[::Send Å
!+'::Send Ä
!+;::Send Ö

^#e::WinMove, A,, -10, 0, %WTwoThird%, %FullHeight%
^#d::WinMove, A,, -10, 0, %WThird%, %FullHeight%
^#f::WinMove, A,, %WTwoThird%, 0, %WThird%, %FullHeight%
^#r::WinMove, A,, %WThird%, 0, %WTwoThird%, %FullHeight%


!c::
IfWinExist ahk_exe speedcrunch.exe
	WinActivate ahk_exe speedcrunch.exe
Else 
	Run "c:\Local Personal Storage\bin\speedcrunch-0.12-win32\speedcrunch.exe"
return


!+w::
IfWinExist ahk_exe LicenseManager.exe
	WinActivate ahk_exe LicenseManager.exe
Else 
	Run "c:\Local Personal Storage\bin\DMag License Monitor\LicenseManager.exe"
return




!s::
IfWinExist ahk_exe sublime_text.exe
	WinActivate ahk_exe sublime_text.exe
Else 
	Run "c:\Local Personal Storage\bin\Sublime Text x86\sublime_text.exe"
return


!+s::
IfWinExist ahk_exe Code.exe
	WinActivate ahk_exe Code.exe
Else 
	Run "c:\Local Personal Storage\bin\VSCode\Code.exe"
return


!e::
DetectHiddenWindows On
Sleep 10
IfWinExist Outlook
{
	WinActivate
}
Else
	Run "C:\Program Files (x86)\Microsoft Office\root\Office16\OUTLOOK.EXE"
DetectHiddenWindows Off
return