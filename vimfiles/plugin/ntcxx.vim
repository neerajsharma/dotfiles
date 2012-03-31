"Syntax highlighting for NT source files

" New keywords for COM
syn keyword ntcxxKeyword interface

hi link ntcxxKeyword Keyword

"Highlight stardard Win32 types like normal types

" Macros for C types
syn keyword ntcxxWinType BYTE CHAR UCHAR SHORT USHORT WORD LONG ULONG DWORD
syn keyword ntcxxWinType WCHAR TCHAR LPCTSTR LPCWSTR LPCSTR LPSTR LPTSTR LPWSTR
syn keyword ntcxxWinType LPVOID LONG_PTR PVOID PPVOID BOOL
syn keyword ntcxxWinType XFLOAT XINT32 XUINT32 XDOUBLE XBYTE XBOOL XPOINTF XRESULT XCHAR

" COM OLE types
syn keyword ntcxxWinType HRESULT BSTR VARIANT SAFEARRAY IUnknown IDispatch

" UI Handles
syn keyword ntcxxWinType HWND HICON HCURSOR HBITMAP HGDIOBJ HDC HFONT
syn keyword ntcxxWinType LPARAM WPARAM

" Object Handles
syn keyword ntcxxWinType HANDLE HGLOBAL HINSTANCE HMODULE

hi link ntcxxWinType Type

"Highlight some standard Win32 Macros
syn keyword ntcxxMacro HRESULT_FROM_WIN32 STDMETHOD STDMETHODIMP WINAPI DBG
syn keyword ntcxxMacro IFC IFCPTR IFCOOM RRETURN 

hi link ntcxxMacro Macro

"Highlight some commonly used Win32 Constants
syn keyword ntcxxConstant S_OK S_FALSE E_INVALIDARG E_POINTER E_OUTOFMEMORY
syn keyword ntcxxConstant ERROR_SUCCESS ERROR_PATH_NOT_FOUND

hi link ntcxxConstant Constant

"Discourage bad habits by flagging the following flags as errors
syn keyword ntcxxBadConstant E_FAIL E_NOTIMPL

hi link ntcxxBadConstant Error

"highlight atrificial function parameter modifier
"  no good preset group for this, so highlight them as comments
syn keyword ntcxxParamMod IN OUT OPTIONAL

" SAL Annotations
syn keyword ntcxxParamMod  __deref_out __in __out __checkReturn __in_ecount __in_z
syn keyword ntcxxParamMod __in_opt __in_bcount __out_bcount __out_opt  

hi link ntcxxParamMod Macro

"
" Begin IIS/Application Center section
"

"hilight tracing macros differently from normal macros
syn keyword ntcxxTraceMacro DBG_CONTEXT
syn keyword ntcxxTraceMacro DBGERRORW DBGERROR CHKERRORW CHKERROR 
syn keyword ntcxxTraceMacro DBGERRORT CHKERRORT
syn keyword ntcxxTraceMacro DBGWARN DBGWARNW CHKWARN CHKWARNW
syn keyword ntcxxTraceMacro DBGWARNT CHKWARNT
syn keyword ntcxxTraceMacro DBGINFO DBGINFOW CHKINFO CHKINFOW
syn keyword ntcxxTraceMacro DBGINFOT CHKINFOT
syn keyword ntcxxTraceMacro BREAKONFAILURE BREAKONFAILUREEX
syn keyword ntcxxTraceMacro CLEANUPONFAILURE CLEANUPONFAILUREEX

hi ntcxxTraceMacro term=bold ctermfg=Red guifg=Red

" hilight assert macros differently, so they immediately draw attention
syn keyword ntcxxAssertMacro DBG_ASSERT DBG_REQUIRE ASSERT

hi ntcxxAssertMacro term=reverse cterm=bold ctermfg=Red gui=bold guifg=Red

" flag asserts from ATL and std C as errors, because they do not build in
" the build env
syn keyword ntcxxBadAssertMacro _ASSERT assert _VERIFY VERIFY

hi link ntcxxBadAssertMacro Error

"Documentation Hilighting
" Keywords inside a doc comment
syn keyword ntcxxDocTag File Author Created History Revision Abstract contained
syn keyword ntcxxDocTag Project Module Description Arguments Notes contained
syn keyword ntcxxDocTag Class Name Return Value Routine Constraints contained

syn region ntcxxDocComment start="/\*\**++" end="--\*\**/" contains=ntcxxDocTag

hi ntcxxDocComment ctermfg=DarkGray guifg=DarkGray
hi ntcxxDocTag cterm=bold ctermfg=DarkGray gui=bold guifg=DarkGray

