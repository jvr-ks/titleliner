@rem restart32.bat

@cd %~dp0


@echo No news available!
@echo.
@echo Please press a key to restart Titleliner (32 bit)!
@echo.
@pause

@copy /Y titleliner.exe.tmp titleliner32.exe

@start titleliner32.exe

@del *.tmp

@exit