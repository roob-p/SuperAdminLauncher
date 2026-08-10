#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=icon.ico
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Description=Accumulator
#AutoIt3Wrapper_Res_Fileversion=1.0.0.3
#AutoIt3Wrapper_Res_ProductName=Elevated Launcher
#AutoIt3Wrapper_Res_ProductVersion=1.0.0.3
#AutoIt3Wrapper_Res_CompanyName=roob-p (author)
#AutoIt3Wrapper_Res_LegalCopyright=roob-p
#AutoIt3Wrapper_Res_Language=1040
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <File.au3>
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
#include <Misc.au3>
#include <MsgBoxConstants.au3>
#include <MsgBoxConstants.au3>
#include <Process.au3>


while 1


if _IsPressed(11) then
shellexecute("c:\windows\system32\schtasks", '/run /tn "Elevated Launcher')

endif

wend