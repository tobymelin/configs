;#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode 2

title_spotify:="ahk_exe Spotify.exe"


!x::Media_Play_Pause
!+x::Volume_Mute
!v::Media_Next
!+v::Media_Prev

!WheelUp::Send "{PgUp}"
!WheelDown::Send "{PgDn}"

!r::Run "cmd.exe"
!+3::Run "C:\Windows\System32\SnippingTool.exe"
!+t::Run "C:\Windows\System32\charmap.exe"
;!e::Run "C:\Program Files (x86)\Microsoft Office\root\Office16\OUTLOOK.EXE"

LAlt & j::AltTab
LAlt & k::ShiftAltTab

!+c::Send "!{F4}"
!m::WinMinimize "A"
!w::WinMinimize "A"
!3::Send "£"
![::Send "å"
!'::Send "ä"
!;::Send "ö"
!+[::Send "Å"
!+'::Send "Ä"
!+;::Send "Ö"


!c::
{
	if WinExist("ahk_exe speedcrunch.exe")
		WinActivate
	else if FileExist("c:\var\bin\speedcrunch-0.12-win32\speedcrunch.exe")
		Run "c:\var\bin\speedcrunch-0.12-win32\speedcrunch.exe"
	else
		MsgBox "Could not open Speedcrunch"
}


!+w::
{
	if WinExist("ahk_exe LicenseManager.exe")
		WinActivate
	else if FileExist("c:\var\bin\DMag License Monitor\LicenseManager.exe")
		Run "c:\var\bin\DMag License Monitor\LicenseManager.exe"
	else
		MsgBox "Could not open License Monitor"
}


!s::
{
	if WinExist("ahk_exe sublime_text.exe")
		WinActivate
	else if FileExist("c:\Program Files\Sublime Text 3\sublime_text.exe")
		Run "c:\Program Files\Sublime Text 3\sublime_text.exe"
	else if FileExist("c:\var\bin\Sublime Text\sublime_text.exe")
		Run "c:\var\bin\Sublime Text\sublime_text.exe"
	else
		MsgBox "Could not open Sublime Text"
}

!+s::
{
	if WinExist("ahk_exe Code.exe")
		WinActivate
	else if FileExist("c:\var\bin\VSCode\Code.exe")
		Run "c:\var\bin\VSCode\Code.exe"
	else if FileExist("c:\Program Files\Microsoft VS Code\Code.exe")
		Run "c:\Program Files\Microsoft VS Code\Code.exe"
	else if FileExist("c:\Users\" . A_UserName . "\AppData\Local\Programs\Microsoft VS Code\Code.exe")
		Run "c:\Users\" . A_UserName . "\AppData\Local\Programs\Microsoft VS Code\Code.exe"
	else
		MsgBox "Could not open VS Code"
}

!e::
{
	DetectHiddenWindows True
	Sleep 10
	if WinExist("Outlook")
	{
		WinActivate
	}
	else
		Run "C:\Program Files (x86)\Microsoft Office\root\Office16\OUTLOOK.EXE"
	DetectHiddenWindows False
}
