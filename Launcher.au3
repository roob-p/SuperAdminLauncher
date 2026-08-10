#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=icon.ico
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Description=Elevated Launcher, Launcher exe
#AutoIt3Wrapper_Res_Fileversion=1.0.3.0
#AutoIt3Wrapper_Res_ProductName=Elevated Launcher
#AutoIt3Wrapper_Res_ProductVersion=1.0.3
#AutoIt3Wrapper_Res_CompanyName=roob-p (author)
#AutoIt3Wrapper_Res_LegalCopyright=roob-p (author)
#AutoIt3Wrapper_Res_LegalTradeMarks=roob-p (author)
#AutoIt3Wrapper_Res_Language=1040
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

$temp="C:\temp\ElevatedLauncher.txt"
FileOpen($temp,0)
$aFiles=FileReadToArray($temp)
FileClose($temp)
 For $i = 0 To UBound($aFiles) - 1
shellexecute($aFiles[$i])
 next
 FileDelete($temp)