@rem restart64.bat

@cd %~dp0


@echo No news available!
@echo.
@echo Please press a key to restart Titleliner (64 bit)!
@echo.
@pause

@copy /Y titleliner.exe.tmp titleliner.exe

@start titleliner.exe

@exit