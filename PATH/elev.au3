#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\icon.ico
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Description=Elevated Launcher - elev (PATH Container)
#AutoIt3Wrapper_Res_Fileversion=1.0.3.0
#AutoIt3Wrapper_Res_ProductName=Elevated Launcher
#AutoIt3Wrapper_Res_ProductVersion=1.0.3
#AutoIt3Wrapper_Res_CompanyName=roob-p (author)
#AutoIt3Wrapper_Res_LegalCopyright=roob-p (author)
#AutoIt3Wrapper_Res_LegalTradeMarks=roob-p (author)
#AutoIt3Wrapper_Res_Language=1040
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <File.au3>


$temp="C:\temp\ElevatedLauncher.txt"
_FileCreate ($temp)


for $i=1 to ubound($cmdline)-1
	If Not StringRegExp($CmdLine[$i], "^[A-Za-z]:\\") Then
	$cmdline[$i]=@WorkingDir&"\"& $cmdline[$i]
	endif
Next

	FileOpen($temp,2)
	_FileWriteFromArray($temp,$cmdline,1)
	FileClose($temp)

	shellexecute("c:\windows\system32\schtasks", '/run /tn "Elevated Launcher"')