@rem restartA32.bat

@cd %~dp0


@echo No news available!
@echo.
@echo Please press a key to restart Titleliner (32 bit ANSI)!
@echo.
@pause

@copy /Y titleliner.exe.tmp titlelinerA32.exe

@start titlelinerA32.exe

@del *.tmp

@exit