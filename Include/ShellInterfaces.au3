#include-once


; === IColumnManager interface ===

Global Const $sIID_IColumnManager  = "{D8EC27BB-3F3B-4042-B10A-4ACFD924D453}"
Global Const $tRIID_IColumnManager = Shell_GUIDFromString( $sIID_IColumnManager )
Global Const $dtag_IColumnManager  = _
	"SetColumnInfo hresult(struct*;struct*);" & _
	"GetColumnInfo hresult(struct*;struct*);" & _
	"GetColumnCount hresult(dword;uint*);" & _
	"GetColumns hresult(dword;struct*;uint);" & _
	"SetColumns hresult(struct*;uint);"

; CM_COLUMNINFO structure
Global Const $tagCM_COLUMNINFO = _
	"dword cbSize;" & _
	"dword dwMask;" & _
	"dword dwState;" & _
	"uint  uWidth;" & _
	"uint  uDefaultWidth;" & _
	"uint  uIdealWidth;" & _
	"wchar wszName[80]"

; PROPERTYKEY Structure
Global Const $tagPROPERTYKEY = "struct;ulong Data1;ushort Data2;ushort Data3;byte Data4[8];endstruct" & ";dword pid"

; Flags to specify which set of columns are being requested
Global Const $CM_ENUM_ALL                 = 0x00000001
Global Const $CM_ENUM_VISIBLE             = 0x00000002

; CM_MASK constants
Global Const $CM_MASK_WIDTH               = 0x00000001
Global Const $CM_MASK_DEFAULTWIDTH        = 0x00000002
Global Const $CM_MASK_IDEALWIDTH          = 0x00000004
Global Const $CM_MASK_NAME                = 0x00000008
Global Const $CM_MASK_STATE               = 0x00000010

; CM_STATE constants
Global Const $CM_STATE_NONE               = 0x00000000
Global Const $CM_STATE_VISIBLE            = 0x00000001
Global Const $CM_STATE_FIXEDWIDTH         = 0x00000002
Global Const $CM_STATE_NOSORTBYFOLDERNESS = 0x00000004

; CM_SET_WIDTH_VALUE constants
Global Const $CM_WIDTH_USEDEFAULT         = -0x00000001
Global Const $CM_WIDTH_AUTOSIZE           = -0x00000002


; === ICommDlgBrowser interface ===

Global Const $sIID_ICommDlgBrowser  = "{000214F1-0000-0000-C000-000000000046}"
Global Const $tRIID_ICommDlgBrowser = Shell_GUIDFromString( $sIID_ICommDlgBrowser )
Global Const $dtag_ICommDlgBrowser  = _
	"OnDefaultCommand hresult(ptr);" & _
	"OnStateChange hresult(ptr;ulong);" & _
	"IncludeObject hresult(ptr;ptr);"


; === IContextMenu interface ===

Global Const $sIID_IContextMenu  = "{000214E4-0000-0000-C000-000000000046}"
Global Const $tRIID_IContextMenu = Shell_GUIDFromString( $sIID_IContextMenu )
Global Const $dtag_IContextMenu  = _
	"QueryContextMenu hresult(handle;uint;uint;uint;uint);" & _
	"InvokeCommand hresult(struct*);" & _
	"GetCommandString hresult(uint;uint;uint*;ptr;uint);"

Global Const $CMF_NORMAL        = 0x00000000
Global Const $CMF_DEFAULTONLY   = 0x00000001
Global Const $CMF_EXTENDEDVERBS = 0x00000100
Global Const $CMF_EXPLORE       = 0x00000004

Global Const $SW_SHOWNORMAL = 1

; CMINVOKECOMMANDINFO structure
Global Const $tagCMINVOKECOMMANDINFO = "dword cbSize;dword fMask;hwnd hWnd;ptr lpVerb;ptr lpParameters;" & _
                                       "ptr lpDirectory;int nShow;dword dwHotKey;handle hIcon"


; === IDispatch interface ===

Global Const $sIID_IDispatch = "{00020400-0000-0000-C000-000000000046}"
Global Const $dtag_IDispatch = _
	"GetTypeInfoCount hresult(dword*);" & _
	"GetTypeInfo hresult(dword;dword;ptr*);" & _
	"GetIDsOfNames hresult(ptr;ptr;dword;dword;ptr);" & _
	"Invoke hresult(dword;ptr;dword;word;ptr;ptr;ptr;ptr);"


; === IEnumIDList interface ===

Global Const $sIID_IEnumIDList  = "{000214F2-0000-0000-C000-000000000046}"
Global Const $tRIID_IEnumIDList = Shell_GUIDFromString( $sIID_IEnumIDList )
Global Const $dtag_IEnumIDList  = _
	"Next hresult(ulong;ptr*;ulong*);" & _
	"Reset hresult();" & _
	"Skip hresult(ulong);" & _
	"Clone hresult(ptr*);"


; === IExplorerBrowser interface ===

Global Const $sCLSID_ExplorerBrowser = "{71F96385-DDD6-48D3-A0C1-AE06E8B055FB}"
Global Const $tCLSID_ExplorerBrowser = Shell_GUIDFromString( $sCLSID_ExplorerBrowser )
Global Const $sIID_IExplorerBrowser  = "{DFD3B6B5-C10C-4BE9-85F6-A66969F402F6}"
Global Const $tRIID_IExplorerBrowser = Shell_GUIDFromString( $sIID_IExplorerBrowser )
Global Const $dtag_IExplorerBrowser  = _
	"Initialize hresult(hwnd;struct*;struct*);" & _
	"Destroy hresult();" & _
	( @AutoItX64 ? "SetRect hresult(ptr;struct*);" : "SetRect hresult(ptr;long;long;long;long);" ) & _
	"SetPropertyBag hresult(ptr);" & _
	"SetEmptyText hresult(ptr);" & _
	"SetFolderSettings hresult(ptr);" & _
	"Advise hresult(ptr;dword*);" & _
	"Unadvise hresult(dword);" & _
	"SetOptions hresult(dword);" & _
	"GetOptions hresult(dword*);" & _
	"BrowseToIDList hresult(ptr;uint);" & _
	"BrowseToObject hresult(ptr;uint);" & _
	"FillFromObject hresult(ptr;dword);" & _
	"RemoveAll hresult();" & _
	"GetCurrentView hresult(struct*;ptr*);"

; --- EXPLORER_BROWSER_OPTIONS for SetOptions and GetOptions dwFlag ---

Global Const $EBO_NONE               = 0x00000000
Global Const $EBO_NAVIGATEONCE       = 0x00000001
Global Const $EBO_SHOWFRAMES         = 0x00000002
Global Const $EBO_ALWAYSNAVIGATE     = 0x00000004
Global Const $EBO_NOTRAVELLOG        = 0x00000008
Global Const $EBO_NOWRAPPERWINDOW    = 0x00000010
Global Const $EBO_HTMLSHAREPOINTVIEW = 0x00000020


; === IExplorerBrowserEvents interface ===

Global Const $sIID_IExplorerBrowserEvents = "{361BBDC7-E6EE-4E13-BE58-58E2240C810F}"
Global Const $dtag_IExplorerBrowserEvents = _
	"OnNavigationPending hresult(ptr);" & _
	"OnViewCreated hresult(ptr);" & _
	"OnNavigationComplete hresult(ptr);" & _
	"OnNavigationFailed hresult(ptr);"


; === IExplorerPaneVisibility interface ===

Global Const $sIID_IExplorerPaneVisibility  = "{E07010EC-BC17-44C0-97B0-46C7C95B9EDC}"
Global Const $tRIID_IExplorerPaneVisibility = Shell_GUIDFromString( $sIID_IExplorerPaneVisibility )
Global Const $dtag_IExplorerPaneVisibility  = _
	"GetPaneState hresult(ptr;uint*);"


; === IFolderFilter interface ===

Global Const $sIID_IFolderFilter = "{9CC22886-DC8E-11D2-B1D0-00C04F8EEB3E}"
Global Const $dtag_IFolderFilter = _
	"ShouldShow hresult(ptr;ptr;ptr);" & _
	"GetEnumFlags hresult(ptr;ptr;hwnd;dword*);"


; === IFolderFilterSite interface ===

Global Const $sIID_IFolderFilterSite  = "{C0A651F5-B48B-11D2-B5ED-006097C686F6}"
Global Const $tRIID_IFolderFilterSite = Shell_GUIDFromString( $sIID_IFolderFilterSite )
Global Const $dtag_IFolderFilterSite  = "SetFilter hresult(ptr);"


; === IFolderView interface ===

Global Const $sIID_IFolderView  = "{CDE725B0-CCC9-4519-917E-325D72FAB4CE}"
Global Const $tRIID_IFolderView = Shell_GUIDFromString( $sIID_IFolderView )
Global Const $dtag_IFolderView  = _
	"GetCurrentViewMode hresult(uint*);" & _
	"SetCurrentViewMode hresult(uint);" & _
	"GetFolder hresult(clsid;ptr*);" & _
	"Item hresult(int;ptr*);" & _
	"ItemCount hresult(uint;int*);" & _
	"Items hresult(uint;clsid;ptr*);" & _
	"GetSelectionMarkedItem hresult(int*);" & _
	"GetFocusedItem hresult(int*);" & _
	"GetItemPosition hresult(ptr;ptr);" & _
	"GetSpacing hresult(ptr);" & _
	"GetDefaultSpacing hresult(ptr);" & _
	"GetAutoArrange hresult();" & _
	"SelectItem hresult(int;dword);" & _
	"SelectAndPositionItems hresult(uint;ptr;ptr;dword);"

; --- ItemCount uFlags ---

Global Const $SVGIO_BACKGROUND     = 0x00000000
Global Const $SVGIO_SELECTION      = 0x00000001
Global Const $SVGIO_ALLVIEW        = 0x00000002
Global Const $SVGIO_CHECKED        = 0x00000003
Global Const $SVGIO_TYPE_MASK      = 0x0000000F
Global Const $SVGIO_FLAG_VIEWORDER = 0x80000000

; --- SelectItem dwFlags ---

Global Const $SVSI_DESELECT       = 0
Global Const $SVSI_SELECT         = 0x1
Global Const $SVSI_EDIT           = 0x3
Global Const $SVSI_DESELECTOTHERS = 0x4
Global Const $SVSI_ENSUREVISIBLE  = 0x8
Global Const $SVSI_FOCUSED        = 0x10
Global Const $SVSI_TRANSLATEPT    = 0x20
Global Const $SVSI_SELECTIONMARK  = 0x40
Global Const $SVSI_POSITIONITEM   = 0x80
Global Const $SVSI_CHECK          = 0x100
Global Const $SVSI_CHECK2         = 0x200
Global Const $SVSI_KEYBOARDSELECT = 0x401
Global Const $SVSI_NOTAKEFOCUS    = 0x40000000
Global Const $SVSI_NOSTATECHANGE  = 0x80000000


; === IFolderView2 interface ===

Global Const $sIID_IFolderView2  = "{1AF3A467-214F-4298-908E-06B03E0B39F9}"
Global Const $tRIID_IFolderView2 = Shell_GUIDFromString( $sIID_IFolderView2 )
Global Const $dtag_IFolderView2  = $dtag_IFolderView & _
	"SetGroupBy hresult();" & _
	"GetGroupBy hresult();" & _
	"SetViewProperty hresult();" & _
	"GetViewProperty hresult();" & _
	"SetTileViewProperties hresult();" & _
	"SetExtendedTileViewProperties hresult();" & _
	"SetText hresult();" & _
	"SetCurrentFolderFlags hresult();" & _
	"GetCurrentFolderFlags hresult();" & _
	"GetSortColumnCount hresult(int*);" & _
	"SetSortColumns hresult(struct*;int);" & _
	"GetSortColumns hresult(struct*;int);" & _
	"GetItem hresult();" & _
	"GetVisibleItem hresult();" & _
	"GetSelectedItem hresult();" & _
	"GetSelection hresult();" & _
	"GetSelectionState hresult();" & _
	"InvokeVerbOnSelection hresult(str);" & _
	"SetViewModeAndIconSize hresult(uint;int);" & _
	"GetViewModeAndIconSize hresult(uint*;int*);" & _
	"SetGroupSubsetCount hresult();" & _
	"GetGroupSubsetCount hresult();" & _
	"SetRedraw hresult(int);" & _
	"IsMoveInSameFolder hresult();" & _
	"DoRename hresult();"

; SORTCOLUMN Structure
Global Const $tagSORTCOLUMN = $tagPROPERTYKEY & ";int sort"


; === IInputObject interface ===

Global Const $sIID_IInputObject  = "{68284FAA-6A48-11D0-8C78-00C04FD918B4}"
Global Const $tRIID_IInputObject = Shell_GUIDFromString( $sIID_IInputObject )
Global Const $dtag_IInputObject  = _
	"UIActivateIO hresult(int;ptr);" & _
	"HasFocusIO hresult();" & _
	"TranslateAcceleratorIO hresult(ptr);"

; --- MSG structure ---

Global Const $tagMSG = "hwnd hwnd;uint message;wparam wParam;lparam lParam;dword time;int X;int Y"


; === IOleWindow interface ===

Global Const $dtag_IOleWindow = _
	"GetWindow hresult(hwnd*);" & _
	"ContextSensitiveHelp hresult(int);"


; === IPersist interface ===

Global Const $sIID_IPersist  = "{0000010C-0000-0000-C000-000000000046}"
Global Const $tRIID_IPersist = Shell_GUIDFromString( $sIID_IPersist )
Global Const $dtag_IPersist = _
	"GetClassID hresult(ptr*);"


; === IPersistFolder interface ===

Global Const $sIID_IPersistFolder  = "{000214EA-0000-0000-C000-000000000046}"
Global Const $tRIID_IPersistFolder = Shell_GUIDFromString( $sIID_IPersistFolder )
Global Const $dtag_IPersistFolder  = $dtag_IPersist & _
	"Initialize hresult(ptr);"


; === IPersistFolder2 interface ===

Global Const $sIID_IPersistFolder2  = "{1AC3D9F0-175C-11d1-95BE-00609797EA4F}"
Global Const $tRIID_IPersistFolder2 = Shell_GUIDFromString( $sIID_IPersistFolder2 )
Global Const $dtag_IPersistFolder2  = $dtag_IPersistFolder & _
	"GetCurFolder hresult(ptr*);"


; === IServiceProvider interface ===

Global Const $sIID_IServiceProvider  = "{6D5140C1-7436-11CE-8034-00AA006009FA}"
Global Const $tRIID_IServiceProvider = Shell_GUIDFromString( $sIID_IServiceProvider )
Global Const $dtag_IServiceProvider  = _
	"QueryService hresult(struct*;struct*;ptr*);"


; === IShellBrowser interface ===

Global Const $sIID_IShellBrowser  = "{000214E2-0000-0000-C000-000000000046}"
Global Const $tRIID_IShellBrowser = Shell_GUIDFromString( $sIID_IShellBrowser )
Global Const $dtag_IShellBrowser  = $dtag_IOleWindow & _
	"InsertMenusSB hresult(handle;ptr);" & _
	"SetMenuSB hresult(handle;handle;hwnd);" & _
	"RemoveMenusSB hresult(handle);" & _
	"SetStatusTextSB hresult(ptr);" & _
	"EnableModelessSB hresult(int);" & _
	"TranslateAcceleratorSB hresult(ptr;word);" & _
	"BrowseObject hresult(ptr;uint);" & _
	"GetViewStateStream hresult(dword;ptr*);" & _
	"GetControlWindow hresult(uint;hwnd);" & _
	"SendControlMsg hresult(uint;uint;wparam;lparam;lresult);" & _
	"QueryActiveShellView hresult(ptr*);" & _
	"OnViewWindowActive hresult(ptr);" & _
	"SetToolbarItems hresult(ptr;uint;uint);"

Global Const $sSID_STopLevelBrowser  = "{4C96BE40-915C-11CF-99D3-00AA004AE837}"
Global Const $tRIID_STopLevelBrowser = Shell_GUIDFromString( $sSID_STopLevelBrowser )

; --- BrowseObject wFlags ---

; These flags specify whether another window is to be created
Global Const $SBSP_DEFBROWSER            = 0x0000
Global Const $SBSP_SAMEBROWSER           = 0x0001
Global Const $SBSP_NEWBROWSER            = 0x0002

; The following flags specify the mode
Global Const $SBSP_DEFMODE               = 0x0000
Global Const $SBSP_OPENMODE              = 0x0010
Global Const $SBSP_EXPLOREMODE           = 0x0020
Global Const $SBSP_HELPMODE              = 0x0040
Global Const $SBSP_NOTRANSFERHIST        = 0x0080

; The following flags specify the category of the pidl parameter
Global Const $SBSP_ABSOLUTE              = 0x0000
Global Const $SBSP_RELATIVE              = 0x1000
Global Const $SBSP_PARENT                = 0x2000
Global Const $SBSP_NAVIGATEBACK          = 0x4000
Global Const $SBSP_NAVIGATEFORWARD       = 0x8000

Global Const $SBSP_ALLOW_AUTONAVIGATE    = 0x00010000

; The following flags specify mode
Global Const $SBSP_KEEPSAMETEMPLATE      = 0x00020000
Global Const $SBSP_KEEPWORDWHEELTEXT     = 0x00040000
Global Const $SBSP_ACTIVATE_NOFOCUS      = 0x00080000

; The following flags control how history is manipulated as a result of navigation
Global Const $SBSP_CREATENOHISTORY       = 0x00100000
Global Const $SBSP_PLAYNOSOUND           = 0x00200000
Global Const $SBSP_CALLERUNTRUSTED       = 0x00800000
Global Const $SBSP_TRUSTFIRSTDOWNLOAD    = 0x01000000
Global Const $SBSP_UNTRUSTEDFORDOWNLOAD  = 0x02000000
Global Const $SBSP_NOAUTOSELECT          = 0x04000000
Global Const $SBSP_WRITENOHISTORY        = 0x08000000
Global Const $SBSP_TRUSTEDFORACTIVEX     = 0x10000000
Global Const $SBSP_FEEDNAVIGATION        = 0x20000000
Global Const $SBSP_REDIRECT              = 0x40000000
Global Const $SBSP_INITIATEDBYHLINKFRAME = 0x80000000


; === IShellFolder interface ===

Global Const $sIID_IShellFolder  = "{000214E6-0000-0000-C000-000000000046}"
Global Const $tRIID_IShellFolder = Shell_GUIDFromString( $sIID_IShellFolder )
Global Const $dtag_IShellFolder  = _
	"ParseDisplayName hresult(hwnd;ptr;wstr;ulong*;ptr*;ulong*);" & _
	"EnumObjects hresult(hwnd;dword;ptr*);" & _
	"BindToObject hresult(ptr;ptr;clsid;ptr*);" & _
	"BindToStorage hresult(ptr;ptr;clsid;ptr*);" & _
	"CompareIDs hresult(lparam;ptr;ptr);" & _
	"CreateViewObject hresult(hwnd;clsid;ptr*);" & _
	"GetAttributesOf hresult(uint;struct*;ulong*);" & _
	"GetUIObjectOf hresult(hwnd;uint;struct*;clsid;uint*;ptr*);" & _
	"GetDisplayNameOf hresult(ptr;dword;struct*);" & _
	"SetNameOf hresult(hwnd;ptr;wstr;dword;ptr*);"

; --- EnumObjects grfFlags ---

Global Const $SHCONTF_CHECKING_FOR_CHILDREN = 0x00010
Global Const $SHCONTF_FOLDERS               = 0x00020
Global Const $SHCONTF_NONFOLDERS            = 0x00040
Global Const $SHCONTF_INCLUDEHIDDEN         = 0x00080
Global Const $SHCONTF_INIT_ON_FIRST_NEXT    = 0x00100
Global Const $SHCONTF_NETPRINTERSRCH        = 0x00200
Global Const $SHCONTF_SHAREABLE             = 0x00400
Global Const $SHCONTF_STORAGE               = 0x00800
Global Const $SHCONTF_NAVIGATION_ENUM       = 0x01000
Global Const $SHCONTF_FASTITEMS             = 0x02000
Global Const $SHCONTF_FLATLIST              = 0x04000
Global Const $SHCONTF_ENABLE_ASYNC          = 0x08000
Global Const $SHCONTF_INCLUDESUPERHIDDEN    = 0x10000

; --- GetDisplayNameOf uFlags ---

Global Const $SHGDN_NORMAL        = 0x0000
Global Const $SHGDN_INFOLDER      = 0x0001
Global Const $SHGDN_FOREDITING    = 0x1000
Global Const $SHGDN_FORADDRESSBAR = 0x4000
Global Const $SHGDN_FORPARSING    = 0x8000

Global Const $tagSTRRET = "uint uType;ptr data;"


; === IShellFolder2 interface ===

Global Const $sIID_IShellFolder2  = "{93F2F68C-1D1B-11D3-A30E-00C04F79ABD1}"
Global Const $tRIID_IShellFolder2 = Shell_GUIDFromString( $sIID_IShellFolder2 )
Global Const $dtag_IShellFolder2  = $dtag_IShellFolder & _
	"GetDefaultSearchGUID hresult();" & _
	"EnumSearches hresult();" & _
	"GetDefaultColumn hresult();" & _
	"GetDefaultColumnState hresult();" & _
	"GetDetailsEx hresult(ptr;struct*;variant*);" & _
	"GetDetailsOf hresult();" & _
	"MapColumnToSCID hresult();"

; PROPERTYKEY Structure
;Global Const $tagPROPERTYKEY = "struct;ulong Data1;ushort Data2;ushort Data3;byte Data4[8];endstruct" & ";dword pid"

; Storage property set format identifier (FMTID)
Global Const $FMTID_Storage = "{B725F130-47EF-101A-A5F1-02608C9EEBAC}"

; The storage property set supports the five PIDs
Global Const $PID_STG_STORAGETYPE = 0x00000004
Global Const $PID_STG_NAME        = 0x0000000A
Global Const $PID_STG_SIZE        = 0x0000000C
Global Const $PID_STG_ATTRIBUTES  = 0x0000000D
Global Const $PID_STG_WRITETIME   = 0x0000000E


; === IShellView interface ===

Global Const $sIID_IShellView  = "{000214E3-0000-0000-C000-000000000046}"
Global Const $tRIID_IShellView = Shell_GUIDFromString( $sIID_IShellView )
Global Const $dtag_IShellView  = $dtag_IOleWindow & _
	"TranslateAccelerator hresult(ptr);" & _
	"EnableModeless hresult(int);" & _
	"UIActivate hresult(uint);" & _
	"Refresh hresult();" & _
	"CreateViewWindow hresult(ptr;ptr;ptr;ptr;hwnd*);" & _
	"DestroyViewWindow hresult();" & _
	"GetCurrentInfo hresult(ptr*);" & _
	"AddPropertySheetPages hresult(dword;ptr;lparam);" & _
	"SaveViewState hresult();" & _
	"SelectItem hresult(ptr;uint);" & _
	"GetItemObject hresult(uint;struct*;ptr*);"

; --- CreateViewWindow FOLDERSETTINGS structure ---

Global Const $tagFOLDERSETTINGS = _
	"uint ViewMode;" & _
	"uint fFlags"

; FOLDERVIEWMODE values
Global Const $FVM_FIRST      = 1
Global Const $FVM_ICON       = 1
Global Const $FVM_SMALLICON  = 2
Global Const $FVM_LIST       = 3
Global Const $FVM_DETAILS    = 4
Global Const $FVM_THUMBNAIL  = 5
Global Const $FVM_TILE       = 6
Global Const $FVM_THUMBSTRIP = 7
Global Const $FVM_CONTENT    = 8
Global Const $FVM_LAST       = 8

; FOLDERFLAGS values
Global Const $FWF_AUTOARRANGE         = 0x00000001
Global Const $FWF_ABBREVIATEDNAMES    = 0x00000002
Global Const $FWF_NOBACKBROWSING      = 0x00000002
Global Const $FWF_SNAPTOGRID          = 0x00000004
Global Const $FWF_OWNERDATA           = 0x00000008
Global Const $FWF_BESTFITWINDOW       = 0x00000008
Global Const $FWF_DESKTOP             = 0x00000020
Global Const $FWF_SINGLESEL           = 0x00000040
Global Const $FWF_NOSUBFOLDERS        = 0x00000080
Global Const $FWF_TRANSPARENT         = 0x00000100
Global Const $FWF_NOCLIENTEDGE        = 0x00000200
Global Const $FWF_NOSCROLL            = 0x00000400
Global Const $FWF_ALIGNLEFT           = 0x00000800
Global Const $FWF_NOICONS             = 0x00001000
Global Const $FWF_SHOWSELALWAYS       = 0x00002000
Global Const $FWF_NOVISIBLE           = 0x00004000
Global Const $FWF_SINGLECLICKACTIVATE = 0x00008000
Global Const $FWF_NOWEBVIEW           = 0x00010000
Global Const $FWF_HIDEFILENAMES       = 0x00020000
Global Const $FWF_CHECKSELECT         = 0x00040000
Global Const $FWF_NOENUMREFRESH       = 0x00080000
Global Const $FWF_NOGROUPING          = 0x00100000
Global Const $FWF_FULLROWSELECT       = 0x00200000
Global Const $FWF_NOFILTERS           = 0x00400000
Global Const $FWF_NOCOLUMNHEADER      = 0x01000000
Global Const $FWF_NOHEADERINALLVIEWS  = 0x02000000
Global Const $FWF_EXTENDEDTILES       = 0x01000000
Global Const $FWF_TRICHECKSELECT      = 0x02000000
Global Const $FWF_AUTOCHECKSELECT     = 0x04000000
Global Const $FWF_NOBROWSERVIEWSTATE  = 0x08000000
Global Const $FWF_SUBSETGROUPS        = 0x10000000
Global Const $FWF_USESEARCHFOLDER     = 0x40000000
Global Const $FWF_ALLOWRTLREADING     = 0x80000000

; --- UIActivate uState ---

; Flag specifying the activation state of the window
Global Const $SVUIA_DEACTIVATE       = 0
Global Const $SVUIA_ACTIVATE_NOFOCUS = 1
Global Const $SVUIA_ACTIVATE_FOCUS   = 2
Global Const $SVUIA_INPLACEACTIVATE  = 3


; === IShellView2 interface ===

Global Const $sIID_IShellView2  = "{88E39E80-3578-11CF-AE69-08002B2E1262}"
Global Const $tRIID_IShellView2 = Shell_GUIDFromString( $sIID_IShellView2 )
Global Const $dtag_IShellView2  = $dtag_IShellView & _
	"GetView hresult();" & _
	"CreateViewWindow2 hresult();" & _
	"HandleRename hresult();" & _
	"SelectAndPositionItem hresult();"


; === IShellView3 interface ===

Global Const $sIID_IShellView3  = "{EC39FA88-F8AF-41C5-8421-38BED28F4673}"
Global Const $tRIID_IShellView3 = Shell_GUIDFromString( $sIID_IShellView3 )
Global Const $dtag_IShellView3  = $dtag_IShellView2 & _
	"CreateViewWindow3 hresult(ptr;ptr;dword;dword;dword;uint;ptr;ptr;ptr*);"


; === IShellWindows interface ===

Global Const $CLSID_ShellWindows  = "{9BA05972-F6A8-11CF-A442-00A0C90A8F39}"
Global Const $sIID_IShellWindows  = "{85CB6900-4D95-11CF-960C-0080C7F4EE85}"
Global Const $tRIID_IShellWindows = Shell_GUIDFromString( $sIID_IShellWindows )
Global Const $dtag_IShellWindows  = $dtag_IDispatch & _
	"get_Count hresult(long*);" & _
	"Item hresult(variant;ptr*);" & _
	"_NewEnum hresult();" & _
	"Register hresult();" & _
	"RegisterPending hresult();" & _
	"Revoke hresult();" & _
	"OnNavigate hresult();" & _
	"OnActivated hresult();" & _
	"FindWindowSW hresult(variant*;variant*;int;long*;int;ptr*);" & _
	"OnCreated hresult();" & _
	"ProcessAttachDetach hresult();"

; ShellWindowTypeConstants
Global Const $SWC_EXPLORER = 0x0
Global Const $SWC_BROWSER  = 0x1
Global Const $SWC_3RDPARTY = 0x2
Global Const $SWC_CALLBACK = 0x4
Global Const $SWC_DESKTOP  = 0x8

; ShellWindowFindWindowOptions
Global Const $SWFO_NEEDDISPATCH   = 0x1
Global Const $SWFO_INCLUDEPENDING = 0x2
Global Const $SWFO_COOKIEPASSED   = 0x4


; === IUnknown interface ===

Global Const $sIID_IUnknown = "{00000000-0000-0000-C000-000000000046}"
Global Const $dtag_IUnknown = _
	"QueryInterface hresult(ptr;ptr*);" & _
	"AddRef ulong();" & _
	"Release ulong();"


; === IWebBrowser interface ===

Global Const $sIID_IWebBrowser = "{EAB22AC1-30C1-11CF-A7EB-0000C05BAE0B}"
Global Const $dtag_IWebBrowser  = $dtag_IDispatch & _
	"GoBack hresult();" & _
	"GoForward hresult();" & _
	"GoHome hresult();" & _
	"GoSearch hresult();" & _
	"Navigate hresult();" & _
	"Refresh hresult();" & _
	"Refresh2 hresult();" & _
	"Stop hresult();" & _
	"get_Application hresult();" & _
	"get_Parent hresult();" & _
	"get_Container hresult();" & _
	"get_Document hresult();" & _
	"get_TopLevelContainer hresult();" & _
	"get_Type hresult();" & _
	"get_Left hresult();" & _
	"put_Left hresult();" & _
	"get_Top hresult();" & _
	"put_Top hresult();" & _
	"get_Width hresult();" & _
	"put_Width hresult();" & _
	"get_Height hresult();" & _
	"put_Height hresult();" & _
	"get_LocationName hresult(bstr*);" & _
	"get_LocationURL hresult(bstr*);" & _
	"get_Busy hresult();"


; === IWebBrowserApp interface ===

Global Const $sIID_IWebBrowserApp  = "{0002DF05-0000-0000-C000-000000000046}"
Global Const $tRIID_IWebBrowserApp = Shell_GUIDFromString( $sIID_IWebBrowserApp )
Global Const $dtag_IWebBrowserApp  = $dtag_IWebBrowser & _
	"Quit hresult();" & _
	"ClientToWindow hresult();" & _
	"PutProperty hresult();" & _
	"GetProperty hresult();" & _
	"get_Name hresult();" & _
	"get_HWND hresult(hwnd*);" & _
	"get_FullName hresult();" & _
	"get_Path hresult();" & _
	"get_Visible hresult();" & _
	"put_Visible hresult();" & _
	"get_StatusBar hresult();" & _
	"put_StatusBar hresult();" & _
	"get_StatusText hresult();" & _
	"put_StatusText hresult();" & _
	"get_ToolBar hresult();" & _
	"put_ToolBar hresult();" & _
	"get_MenuBar hresult();" & _
	"put_MenuBar hresult();" & _
	"get_FullScreen hresult();" & _
	"put_FullScreen hresult();"


; Copied from _WinAPI_GUIDFromString
Func Shell_GUIDFromString( $sGUID )
	Local $tGUID = DllStructCreate( "struct;ulong Data1;ushort Data2;ushort Data3;byte Data4[8];endstruct" )
	DllCall( "ole32.dll", "long", "CLSIDFromString", "wstr", $sGUID, "struct*", $tGUID )
	Return $tGUID
EndFunc
