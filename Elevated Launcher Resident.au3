#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=icon.ico
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Description=Elevated Launcher Resident script
#AutoIt3Wrapper_Res_Fileversion=1.0.3.0
#AutoIt3Wrapper_Res_ProductName=Elevated Launcher
#AutoIt3Wrapper_Res_ProductVersion=1.0.3
#AutoIt3Wrapper_Res_CompanyName=roob-p (author)
#AutoIt3Wrapper_Res_LegalCopyright=roob-p (author)
#AutoIt3Wrapper_Res_LegalTradeMarks=roob-p (author)
#AutoIt3Wrapper_Res_Language=1040
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include "Include\FileExplorer.au3"
#include <Array.au3>
#include <Misc.au3>
#include <File.au3>



;TraySetToolTip("No selected files")
$stext=""

$temp="C:\temp\ElevatedLauncher.txt"
$task="Elevated Launcher"
$pressed=false
$pressedB3=false


$inifile=@ScriptDir & "\config.ini"

$b1=IniRead($inifile,"Shortcuts","B1","12")    ;12=alt
$b2=IniRead($inifile,"Shortcuts","B2","5B")    ;5B=winkey (sx) (perfect)  ;10=shift (avoid, used by Windows for selection)) ;11=ctrl (avoid, used by Windows for multiple selection)
$b3=IniRead($inifile,"Shortcuts","B3","52")    ;52=R
$mb=IniRead($inifile,"Shortcuts","mB","01")    ;01=mouseleft button


;_WinAPI_SetWindowsHookEx
 ;_WinAPI_SetWindowsHookEx($WH_KEYBOARD_LL,DllCallbackGetPtr($g_hStub_KeyProc), $hMod)


while 1
if _IsPressed($b1) and _IsPressed($b2) Then
	File()
	sleep(1)
else
	$pressed=false
	$pressedB3=false
	sleep(50)
	endif

wend



Func File()
_FileCreate ($temp)
	Local $hExplorer = WinGetHandle("[ACTIVE]")

    GetIShellBrowser( $hExplorer )

    Local $objShell = ObjCreate( "shell.application" )

    GetShellInterfaces()

    ; Get selected files with full path
    ;GetFiles( $fSelected = False, $fFullPath = False, $fPidl = False, $iMax = 0 )
    $aFiles = GetFiles( True, True )



	If IsArray($aFiles) Then
		TraySetToolTip($stext)

		FileOpen($temp,2)
		_FileWriteFromArray($temp,$aFiles)
		FileClose($temp)
		;sleep(50)
		if _IsPressed(01) and $pressed=false Then  ;and IsArray($aFiles) and _IsPressed($b1)
			$pressed=true

		shellexecute("c:\windows\system32\schtasks", '/run /tn "Elevated Launcher"')


		endif

		if _IsPressed($B3) and _IsPressed($b2) and IsArray($aFiles) and $pressedB3=false Then
			$pressedB3=true
			shellexecute("c:\windows\system32\schtasks", '/run /tn "Elevated Launcher"')

		endif

Else

EndIf


EndFunc