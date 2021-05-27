@rem compile.bat

@echo off

@cd %~dp0

@rem Defender detects it as a virus!
@rem call "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in titleliner.ahk /out titleliner.exe /icon titleliner.ico /bin "C:\Program Files\AutoHotkey\Compiler\Unicode 64-bit.bin"

@rem Defender detects it as a virus!
@rem call "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in titleliner.ahk /out titleliner.exe /icon titleliner.ico /bin "C:\Program Files\AutoHotkey\Compiler\ANSI 32-bit.bin"

@call titleliner.exe remove 

"C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in titleliner.ahk /out titleliner.exe /icon titleliner.ico /bin "C:\Program Files\AutoHotkey\Compiler\Unicode 64-bit.bin"
exit
