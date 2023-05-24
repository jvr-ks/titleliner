@rem restart.bat
@rem !file is overwritten by update process!

@cd %~dp0


@echo No news available!
@echo.
@echo If you finished editing (etc. ...), please press a key to restart titleliner (%1 bit)!
@echo.
@pause

@echo off

@set version=%1
@if [%1]==[64] set version=

@if [%2]==[noupdate] goto noupdate

@copy /Y titleliner.exe.tmp titleliner%version%.exe

:noupdate
@del titleliner.exe.tmp
@start titleliner%version%.exe

:end
@exit