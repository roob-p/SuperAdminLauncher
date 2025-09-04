#include-once

#include <FileConstants.au3>
#include <WinAPIShellEx.au3>
#include <WinAPICom.au3>

Global Const $NULL    = 0x00000000
Global Const $S_FALSE = 0x00000001

Global Const $MAX_PATH = 260

; PKEYSTR_MAX Value
Global Const $PKEY_PIDSTR_MAX = 10                                                 ; Will take care of any long integer value
Global Const $GUIDSTRING_MAX  = ( 1 + 8 + 1 + 4 + 1 + 4 + 1 + 4 + 1 + 12 + 1 + 1 ) ; "{12345678-1234-1234-1234-123456789012}"
Global Const $PKEYSTR_MAX     = ( $GUIDSTRING_MAX + 1 + $PKEY_PIDSTR_MAX )         ; = 50

; PIDL for Desktop. Empty PIDL only containing the terminating 2-byte NULL.
Global Const $pPidlAbsDesktop = _WinAPI_ShellGetSpecialFolderLocation( $CSIDL_DESKTOP )


; --- Shell functions ---

Func ILAppendID( $pidl, $pmkid, $fAppend )
	Local $aRet = DllCall( "Shell32.dll", "ptr", "ILAppendID", "ptr", $pidl, "ptr", $pmkid, "int", $fAppend )
	If @error Then Return SetError(1, 0, 0)
	Return $aRet[0]
EndFunc

Func ILClone( $pidl )
	Local $aRet = DllCall( "Shell32.dll", "ptr", "ILClone", "ptr", $pidl )
	If @error Then Return SetError(1, 0, 0)
	Return $aRet[0]
EndFunc

Func ILCombine( $pidlAbs, $pidlRel )
	Local $aRet = DllCall( "Shell32.dll", "ptr", "ILCombine", "ptr", $pidlAbs, "ptr", $pidlRel )
	If @error Then Return SetError(1, 0, 0)
	Return $aRet[0]
EndFunc

Func ILCreateFromPath( $sPath )
	Local $aRet = DllCall( "Shell32.dll", "ptr", "ILCreateFromPathW", "wstr", $sPath )
	If @error Then Return SetError(1, 0, 0)
	Return $aRet[0]
EndFunc

Func ILFindChild( $pidlParent, $pidlChild )
	Local $aRet = DllCall( "Shell32.dll", "ptr", "ILFindChild", "ptr", $pidlParent, "ptr", $pidlChild )
	If @error Then Return SetError(1, 0, 0)
	Return $aRet[0]
EndFunc

Func ILFindLastID( $pidl )
	Local $aRet = DllCall( "Shell32.dll", "ptr", "ILFindLastID", "ptr", $pidl )
	If @error Then Return SetError(1, 0, 0)
	Return $aRet[0]
EndFunc

Func ILGetSize( $pidl )
	Local $aRet = DllCall( "Shell32.dll", "uint", "ILGetSize", "ptr", $pidl )
	If @error Then Return SetError(1, 0, 0)
	Return $aRet[0]
EndFunc

Func ILIsEqual( $pidl1, $pidl2 )
	Local $aRet = DllCall( "Shell32.dll", "int", "ILIsEqual", "ptr", $pidl1, "ptr", $pidl2 )
	If @error Then Return SetError(1, 0, 0)
	Return $aRet[0]
EndFunc

Func ILIsParent( $pidlParent, $pidlChild, $fImmediate )
	Local $aRet = DllCall( "Shell32.dll", "int", "ILIsParent", "ptr", $pidlParent, "ptr", $pidlChild, "int", $fImmediate )
	If @error Then Return SetError(1, 0, 0)
	Return $aRet[0]
EndFunc

Func ILRemoveLastID( ByRef $pidl )
	Local $aRet = DllCall( "Shell32.dll", "int", "ILRemoveLastID", "ptr", $pidl )
	If @error Then Return SetError(1, 0, 0)
	$pidl = $aRet[1]
	Return $aRet[0]
EndFunc

Func OleInitialize()
	Local $aRet = DllCall("Ole32.dll", "long", "OleInitialize", "ptr", 0)
	If @error Then Return SetError(1, 0, 0)
	Return $aRet[0]
EndFunc

Func OleUninitialize()
	DllCall("Ole32.dll", "none", "OleUninitialize")
	If @error Then Return SetError(1, 0, 0)
	Return 0
EndFunc

Func PSGetNameFromPropertyKey( $pPropKey, ByRef $sName )
	Local $aRet = DllCall( "Propsys.dll", "long", "PSGetNameFromPropertyKey", "ptr", $pPropKey, "ptr*", 0 )
	If @error Or $aRet[0] Then Return SetError(1, 0, 0)
	$sName = DllStructGetData( DllStructCreate( "wchar[" & $PKEYSTR_MAX & "]", $aRet[2] ), 1 )
	_WinAPI_CoTaskMemFree( $aRet[2] )
	Return $aRet[0]
EndFunc

Func PSStringFromPropertyKey( $pPropKey, ByRef $sName )
	Local $tName = DllStructCreate( "wchar[" & $PKEYSTR_MAX & "]" )
	Local $aRet = DllCall( "Propsys.dll", "long", "PSStringFromPropertyKey", "ptr", $pPropKey, "struct*", $tName, "uint", $PKEYSTR_MAX )
	If @error Or $aRet[0] Then Return SetError(1, 0, 0)
	$sName = DllStructGetData( $tName, 1 )
	Return $aRet[0]
EndFunc

Func SHBindToParent( $pidl, $riid, ByRef $pIShellFolder, ByRef $pidlRel )
	Local $aRet = DllCall( "Shell32.dll", "long", "SHBindToParent", "ptr", $pidl, "ptr", $riid, "ptr*", 0, "ptr*", 0 )
	If @error Then Return SetError(1, 0, 0)
	$pIShellFolder = $aRet[3]
	$pidlRel = $aRet[4]
	Return $aRet[0]
EndFunc

; Copied from WinAPIEx.au3 by Yashied and modified to identify
; the file or folder through a pointer to a fully qualified PIDL.
Func ShellGetFileInfo($pidl, $iFlags, $iAttributes, ByRef $tSHFILEINFO)
	Local $aRet = DllCall("Shell32.dll", 'dword_ptr', 'SHGetFileInfoW', 'ptr', $pidl, 'dword', $iAttributes, 'ptr', DllStructGetPtr($tSHFILEINFO), 'uint', DllStructGetSize($tSHFILEINFO), 'uint', $iFlags)
	If @error Then Return SetError(1, 0, 0)
	Return $aRet[0]
EndFunc

Func SHGetDesktopFolder( ByRef $pIShellFolder )
	Local $aRet = DllCall( "Shell32.dll", "uint", "SHGetDesktopFolder", "ptr*", 0 )
	If @error Then Return SetError(1, 0, 0)
	$pIShellFolder = $aRet[1]
	Return $aRet[0]
EndFunc

Func SHGetPathFromIDList( $pidl, ByRef $sPath )
	Local $stPath = DllStructCreate( "wchar[" & $MAX_PATH & "]" )
	Local $aRet = DllCall( "Shell32.dll", "int", "SHGetPathFromIDListW", "ptr", $pidl, "ptr", DllStructGetPtr( $stPath ) )
	If @error Then Return SetError(1, 0, 0)
	$sPath = DllStructGetData( $stPath, 1 )
	Return $aRet[0]
EndFunc

Func SHGetSpecialFolderLocation( $hwndOwner, $nFolder, ByRef $ppidl )
	Local $aRet = DllCall( "Shell32.dll", "uint", "SHGetSpecialFolderLocation", "hwnd", $hwndOwner, "int", $nFolder, "ptr*", 0 )
	If @error Then Return SetError(1, 0, 0)
	$ppidl = $aRet[3]
	Return $aRet[0]
EndFunc

Func StrRetToBuf( $pSTRRET, $pidl, ByRef $sBuf, $iBuf = 512 )
	Local $aRet = DllCall( "Shlwapi.dll", "long", "StrRetToBufW", "ptr", $pSTRRET, "ptr", $pidl, "wstr", $sBuf, "uint", $iBuf )
	If @error Then Return SetError(1, 0, 0)
	$sBuf = $aRet[3]
	Return $aRet[0]
EndFunc


; --- Other functions ---

Func GetIconIndex( $sPath )
	Local $fString = IsString( $sPath )
	Local $pidl = $fString ? ILCreateFromPath( $sPath ) : $sPath
	Local $tSHFILEINFO = DllStructCreate( $tagSHFILEINFO )
	Local $iFlags = BitOR( $SHGFI_PIDL, $SHGFI_SYSICONINDEX )
	ShellGetFileInfo( $pidl, $iFlags, 0, $tSHFILEINFO )
	If @error Then Return SetError(1, 0, 0)
	Local $iIcon = DllStructGetData( $tSHFILEINFO, "iIcon" )
	_WinAPI_DestroyIcon( DllStructGetData( $tSHFILEINFO, "hIcon" ) )
	If Not $fString Then Return $iIcon
	_WinAPI_CoTaskMemFree( $pidl )
	Return $iIcon
EndFunc

; Copied from "SMF - Search my Files" by KaFu
Func SystemImageList( $bLargeIcons = False )
	Local $tSHFILEINFO = DllStructCreate( $tagSHFILEINFO )
	Local $dwFlags = BitOR( $SHGFI_USEFILEATTRIBUTES, $SHGFI_SYSICONINDEX )
	If Not $bLargeIcons Then $dwFlags = BitOR( $dwFlags, $SHGFI_SMALLICON )
	Local $hIml = _WinAPI_ShellGetFileInfo( ".txt", $dwFlags, $FILE_ATTRIBUTE_NORMAL, $tSHFILEINFO )
	If @error Then Return SetError( @error, 0, 0 )
	Return $hIml
EndFunc
