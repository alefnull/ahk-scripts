#SingleInstance Force
#NoEnv
#Persistent
#MaxThreadsPerHotkey 20
Process Priority, , A
SetWorkingDir %A_ScriptDir%
SendMode Input
SetBatchLines -1
FileEncoding UTF-8
SetTitleMatchMode 2
ListLines Off
#KeyHistory 20

if not A_IsAdmin
{
    Run *RunAs %A_ScriptFullPath%
    ExitApp
}

if ((A_PtrSize = 8 && A_IsCompiled = "") || !A_IsUnicode) { ;32 bit=4  ;64 bit=8
	 SplitPath,A_AhkPath,,dir
	 if (!FileExist(correct := dir "\AutoHotkeyU32.exe")) {
		 MsgBox requires AHK 32-bit
		 ExitApp
	 }
	 Run,"%correct%" "%A_ScriptName%",%A_ScriptDir%
	 ExitApp
}

icon = null-keys.ico
IfExist, %icon%
Menu, Tray, Icon, %icon%

GroupAdd SCRIPT_EDIT, %A_ScriptName%

SetNumLockState AlwaysOn
SetCapsLockState AlwaysOff
SetScrollLockState AlwaysOff

;#Include lib/Neutron.ahk
#Include lib/Notify.ahk
#Include lib/Clip.ahk
#Include funcs.ahk
#Include null-clip.ahk

is_reloading := ReadConfig("reloading")
If (is_reloading)
{
    sleep 750
    Notify().Toast(" null-keys reloaded ", {Time:3000})
}
else
{
    Notify().Toast(" null-keys loaded ", {Time:3000})
}

ResetConfig()

#Include hotkeys.ahk
#Include hotstrings.ahk

/*
[config]
reloading=0
brewing=0
canceled=0
*/
