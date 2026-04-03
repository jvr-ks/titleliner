@rem titleliner__updateLib.bat

@cd %~dp0

@mkdir _lib

@copy /Y C:\___x2_wrk\_autohotkey\_lib\* .\_lib\*

@copy /Y C:\___x2_wrk\_autohotkey\Lib\hkToDescription.ahk .\Lib\hkToDescription.ahk
@copy /Y C:\___x2_wrk\_autohotkey\Lib\hotkeyToText.ahk .\Lib\hotkeyToText.ahk


@rem @copy /Y C:\___x2_wrk\_autohotkey\Lib\ .\Lib\








