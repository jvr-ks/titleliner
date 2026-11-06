@rem titleliner__updatelib.bat

@cd %~dp0

@mkdir _lib

@copy /Y C:\___x2_wrk\_autohotkey\_lib\* .\_lib\*

@copy /Y C:\___x2_wrk\_autohotkey\lib\hkToDescription.ahk .\lib\hkToDescription.ahk
@copy /Y C:\___x2_wrk\_autohotkey\lib\hotkeyToText.ahk .\lib\hotkeyToText.ahk


@rem @copy /Y C:\___x2_wrk\_autohotkey\lib\ .\lib\








