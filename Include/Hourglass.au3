#include-once

#include <APIResConstants.au3>


Func Hourglass( $fOn )
	Static $fLoadCursor, $hHourglass, $fHourglass = False
	If Not $fLoadCursor Then
		$fLoadCursor = True
		$hHourglass = LoadCursor( $OCR_WAIT )
	EndIf
	If ( $fOn And Not $fHourglass ) Or ( Not $fOn And $fHourglass ) Then
		SetSystemCursor( $hHourglass, $OCR_NORMAL )
		$fHourglass = Not $fHourglass
	EndIf
EndFunc

; The cursor functions below are copied from http://www.autoitscript.com/forum/index.php?showtopic=84400 created by cherdeg

Func LoadCursor( $iCursor )
	Return SetError( @error, @extended, CursorAPI( DllCall( "User32.dll", "int", "LoadCursorA", "hwnd", 0, "int", $iCursor ) ) )
EndFunc

Func SetSystemCursor( $hCursor, $iCursor )
	Return SetError( @error, @extended, CursorAPI( DllCall( "User32.dll", "int", "SetSystemCursor", "int", $hCursor, "int", $iCursor ) ) )
EndFunc

Func CursorAPI( $v_ret )
	Local $err = @error
	Local $ext = @extended
	If Not $err Then
		If IsArray( $v_ret ) Then
			Return $v_ret[0]
		Else
			Return $v_ret
		EndIf
	EndIf
	Return SetError( $err, $ext, 0 )
EndFunc
