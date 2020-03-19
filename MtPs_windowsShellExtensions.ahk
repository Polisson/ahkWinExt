;#SingleInstance force
;#Persistent
;~ SetTitleMatchMode, 2
;~ SetTitleMatchMode, Slow
;SetTitleMatchMode RegEx

; edited with SciTE4AutoHotkey code-editor.

Run %A_ScriptDir%\AutoHotkey.exe %A_ScriptDir%\CClose.ahk 
;Run %A_ScriptDir%\AutoHotkey.exe %A_ScriptDir%\HotCorners.ahk

;{  Hotstrings: https://www.autohotkey.com/docs/Hotstrings.htm-----------------

	;{-----Polish polite expressions correction------
	::ci::Ci
	::cie::Ciê
	::ciê::Ciê
	::ciebie::Ciebie
	::tobie::Tobie
	::ty::Ty
	::wy::Wy
	::twój::Twój
	::tob¹::Tob¹
	::Toba::Tob¹
	:*: ,::,
	:*: .::.
	:*: ?::?
	:*: !::!
	:*:twoi::Twoi
	:*:twoj::Twoj
	;}

:*:;)::;-)
:*::):::-)
:*:;P::;-p
:*::P:::-p
:*::D:::-D
:*:;D:::-D
:*:;|:::-|
:*:;\:::-\
:*:;*:::-*
:*::*:::-*

:*:**9::#9

:*:date#:: ;input current date with string "date#"
FormatTime, now,, yyyy-MM-dd
SendInput %now%
return


;}---Hotsrings--------------------end.


;{-----special characters------
<^>!vk31::Send {U+00A1} ; AltGr + 1 ;INVERTED EXCLAMATION MARK
<^>!vkBF::Send {U+00BF} ; AltGr + / ;INVERTED QUESTION MARK
<^>!vk34::Send {U+00A7} ; AltGr + 4 ;SECTION SIGN (Polish law character)
:*b0:(::){Left}         ; sends ")" character immediately after typing "(" (usefull for coders outside code editing apps )
:*b0:(::){Left}         ; sends ")" character immediately after typing "(" (usefull for coders outside code editing apps )
;}-----------------------------




;{------remapping Windows shortcut keys-------------------------------------

#Esc::Send !{F4}
return

;^q::Send !{F4}
;return

#Space::Send {Blind}{F12}
return

^!Tab:: SendInput #{Tab}
return

$^#x::SendInput ^#{Right}
$^#z::SendInput ^#{Left}


;~ ^#!b::
;~ Run "C:\Programy\!Shell\bbLean\blackbox.exe"-toggle
;~ return


^CtrlBreak::             ;sleeps or hibernates system (Ctrl+Pause)
    DllCall("PowrProf\SetSuspendState", "int", 0, "int", 1, "int", 1) ; Sleep/Suspend
;   DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 0) ; Hibernate:
Return

;sleeps displays (DPMS)
Pause::  
	;BlockInput On
	;Sleep 2000
	;SendMessage 0x112, 0xF170, 2, , Program Manager  ; Monitor off
	
	Run nircmd.exe cmdwait 1000 monitor off
	Sleep 3000
	;BlockInput Off
Return


;{Remaps Win+V to Ctr+Alt+V (Windows clipboard)
#v::
  Run P:\Ditto\Ditto.exe /Open
Return
;}

;{Paste special as streem of characters with variable 'schowek'  on keystroke Ctrl + Shift + Alt + V
^+!v::
schowek=%clipboard%
Send %schowek%
return

^#v::                            ; Text–only paste from ClipBoard (remove formatting)
   Clip0 = %ClipBoardAll%
   ClipBoard = %ClipBoard%       ; Convert to text
;   Send ^a						 ; Select All
   Send ^v                       ; For best compatibility: SendPlay
   Sleep 50                      ; Don't change clipboard while it is pasted! (Sleep > 0)
   ClipBoard = %Clip0%           ; Restore original ClipBoard
   VarSetCapacity(Clip0, 0)      ; Free memory
Return
;}-----------------------------------------




;~ vkAA::
;~ Send !{Space}
;~ return

;~ vkA6::
;~ Send {Esc}
;~ return


; Win+Shift+E to open folder with current file selected.
; Supports SciTE and Notepad++.


$NumpadDot:: 
		KeyWait, NumpadDot, T0.2
		If ErrorLevel                                       
			SendInput {.}	
		Else                                                
			SendInput {,} 
			KeyWait, NumpadDot
		return
return


;}-------------------------------------------------------------------

;~ ~XButton1::
;~ WinGet, ActiveProcessName, ProcessName, A
	;~ if  InStr(ActiveProcessName, "cad")
	;~ {
	;~ Send ^+L
	;~ }
	;~ return

;~ ~XButton2::
;~ WinGet, ActiveProcessName, ProcessName, A
	;~ if  InStr(ActiveProcessName, "cad")
	;~ {
	;~ Send ^+D
	;~ }
	;~ return


;{-----Remap Right Win key to mouse button-----------------------------------------
;~ RWin::

	;~ WinGet, ActiveProcessName, ProcessName, A
	;~ if not InStr(ActiveProcessName, "cad")
		;~ {
		;~ ;ToolTip %ActiveProcessName%.
		;~ KeyWait, RWin, T0.4
		;~ If ErrorLevel                                       
			;~ SendInput {Tab}	
		;~ Else                                                
			;~ SendInput {Enter} 
			;~ KeyWait, RWin
		;~ return
		;~ }
	;~ else
		;~ KeyWait, RWin, T0.4
		;~ If ErrorLevel                                       
			;~ SendInput {Down}	
		;~ Else                                                
			;~ SendInput {Enter} 
			;~ KeyWait, RWin
		;~ return
	;~ return
	
	
	;~ SendInput {XButton2 down}
	;~ keywait, RWin
	;~ SendInput {XButton2 up}
;~ return

;~ ~XButton1 & RWin::
;~ SendInput {Del} 
;~ return

;}-----Remap Right Win key to mouse button------------------------------------end


;~ ;{-----Mouse Tilt debounce-----------------------------------------
;~ #MaxHotkeysPerInterval 200


;~ WheelLeft:: 
;~ WinGet, ActiveProcessName, ProcessName, A
	 ;~ if InStr(ActiveProcessName, "cad")
		;~ SetTimer CADMouseWheelTiltLeft, -50
	 ;~ else
		;~ SetTimer MouseWheelTiltLeft, -50
	 ;~ return
;~ return

;~ CADMouseWheelTiltLeft:
;~ ;Send ^{e}
;~ return

;~ MouseWheelTiltLeft:
;~ Send {WheelLeft}
;~ return


;~ WheelRight:: 
;~ WinGet, ActiveProcessName, ProcessName, A
	 ;~ if InStr(ActiveProcessName, "cad")
		;~ SetTimer CADMouseWheelTiltRight, -50
	;~ else
		;~ SetTimer MouseWheelTiltRight, -50
	 ;~ return
;~ return

;~ CADMouseWheelTiltRight:
;~ ;Send ^{t}
;~ return

;~ MouseWheelTiltRight:
;~ Send {WheelRight}
;~ return


;~ ;}-----Mouse Tilt debounce--------------------------------------end






;{--------------Win/Meta Window Drag-------------------------------------------------------------------------
; This script modified from the original: http://www.autohotkey.com/docs/scripts/EasyWindowDrag.htm
; by The How-To Geek
; http://www.howtogeek.com 

#LButton::
CoordMode, Mouse  ; Switch to screen/absolute coordinates.
MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin% 
if EWD_WinState = 0  ; Only if the window isn't maximized 
    SetTimer, EWD_WatchMouse, 10 ; Track the mouse as the user drags it.
return

EWD_WatchMouse:
GetKeyState, EWD_LButtonState, LButton, P
if EWD_LButtonState = U  ; Button has been released, so drag is complete.
{
    SetTimer, EWD_WatchMouse, off
    return
}
GetKeyState, EWD_EscapeState, Escape, P
if EWD_EscapeState = D  ; Escape has been pressed, so drag is cancelled.
{
    SetTimer, EWD_WatchMouse, off
    WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
    return
}
; Otherwise, reposition the window to match the change in mouse coordinates
; caused by the user having dragged the mouse:
CoordMode, Mouse
MouseGetPos, EWD_MouseX, EWD_MouseY
WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
SetWinDelay, -1   ; Makes the below move faster/smoother.
WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
EWD_MouseStartX := EWD_MouseX  ; Update for the next timer-call to this subroutine.
EWD_MouseStartY := EWD_MouseY
return

;}--------------Win/Meta Window Drag-------------------------------------------------------------------------end

;{--------------Win/Meta Window Close-------------------------------------------------------------------------
#MButton::
CoordMode, Mouse  ; Switch to screen/absolute coordinates.
MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
WinExist("ahk_id " . EWD_MouseWin)
PostMessage, 0x112, 0xF060,,, ahk_id %EWD_MouseWin%
return

;}--------------Win/Meta Window Close-------------------------------------------------------------------------end


;{--------------Make Window transparent and clicable through--------------------------------------------------
;https://autohotkey.com/board/topic/30334-make-a-window-transparent-and-click-through-it/


;}--------------Make Window transparent and clicable through-----------------------------------------------end


;these options moved to  XMousButtonControl
;~ ~MButton & WheelUp::SendInput {Home}
;~ MButton & WheelDown::SendInput {End}


