@rem create_titleliner_exe_link_with_showwindow_in_autostartfolder.bat

@set app=titleliner

@cd %~dp0

@powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\%app%.lnk');$s.TargetPath='%~dp0\%app%.exe';$s.Arguments='showwindow';$s.Save()"

