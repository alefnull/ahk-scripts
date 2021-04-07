﻿;; use capslock as meta key / escape
;; alt + capslock if you *really* need it
CapsLock::Esc
!CapsLock::CapsLock

CapsLock & n::Notify().AddWindow(" testing stuff ")

;; vim navigation
CapsLock & h::Send {Left}
CapsLock & j::Send {Down}
CapsLock & k::Send {Up}
CapsLock & l::Send {Right}
CapsLock & 0::Send {End}
CapsLock & 9::Send {Home}

;; normal useful commands
CapsLock & u::Send ^{z} ; undo
CapsLock & y::Send ^{y} ; redo
CapsLock & q::Send !{F4} ; quit

;; launch or switch to apps (funcs.ahk)
CapsLock & d::discord()
CapsLock & f::firefox()
CapsLock & g::guilded()
CapsLock & p::notepad()
CapsLock & t::terminal()

CapsLock & i::
    Run "C:\Program Files\AutoHotkey\WindowSpy.ahk"
    WinActivate Window Spy
Return

;; tea timer
CapsLock & '::TeaTimer(3)

;; adjust volume via mousewheel over tray/taskbar
#If MouseIsOver("ahk_class Shell_TrayWnd")
    MButton::Send {Volume_Mute}
    WheelUp::Send {Volume_Up 5}
    WheelDown::Send {Volume_Down 5}
#If

;; ueli
CapsLock & Space::Send !{Space}

;; task manager
CapsLock & Backspace::Send +^{Esc}

;; virtual desktop left & right
CapsLock & Left::Send ^#{Left}
CapsLock & Right::Send ^#{Right}

;; empty recycle bin
CapsLock & Del::
    FileRecycleEmpty
    Notify().Toast(" recycle bin emptied ",{Animate:"Blend",Radius:30,Time:3000})
return

;; edit this script in default editor
CapsLock & e::
    Edit
return

;; reload script
CapsLock & r::
    ReloadScript()
return

;; auto-reload script on save
#IfWinActive ahk_group ScriptEdit
~^s::
    ReloadScript()
return
#IfWinActive
