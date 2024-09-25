# Titleliner  

Create section titles in any text!

(Windows 10 only!)  
  
I made this this litte tool to create section titles in my text, examples:    
--------------------------------- Todo today --------------------------------  
  
-------------------------------- Todo tomorrow -------------------------------  

If the text is program-code, select the character that identifies the line as a comment, examples:  
";------------- title -------------"  
or  
"//------------- title -------------"  
etc.  


**Marked the relevant text and press the hotkey (default is: \[Alt] + \[l]).**   

#### Operation
Start the app, app is running in the background.  
(Use "showwindow" parameter  to show the window after startup).  
  
Select the text and then press the hotkey (\[Alt] + \[l] is default).  

    
![Titleliner](/assets/images/titleliner.png)


#### Latest changes 
Version (>=)| Change
------------ | -------------  
0.067 | Multiline-behavior improved
0.066 | Behavior improved
0.062 | Version 32 A (ANSI) removed
0.056 | Updater integrated
0.055 | Menu-entries renamed, "overwrite"-Hotkey introduced (default is: Shift + Alt + L)
0.054 | exitHotkey-default changed to Ctrl + Alt + L, "overwrite"-Hotkey introduced (default is: Shift + Alt + L)
0.051 | Bugfixes
0.050 | AutoinsertDel Menu-button (Replaces selected token)
0.049 | Autoinsert Menu-button
0.047 | Autoinsert: Press hotkey again (release both keys in between!), while Titleliner-window is open.  
  
#### Known issues / bugs 
Issue / Bug | Type | fixed in version
------------ | ------------- | -------------

  
#### Download  
  
Download via Updater from Github:  
**titleliner.exe** 64 bit Windows use:   
[updater.exe 64bit](https://github.com/jvr-ks/titleliner/raw/main/updater.exe)  
or  
**titleliner32.exe** 32 bit Windows use:  
[updater.exe 32bit](https://github.com/jvr-ks/titleliner/raw/main/updater32.exe)  
  
**Be allways sure to use only one of the \*.exe at a time!**
  
[Updater viruscheck see Updater repository](https://github.com/jvr-ks/updater) 
 
Start with Windows:  
* To create a shortcut of "titleliner.exe" in the windows-autostart folder ("shell:startup"),  
run the simple Powershell script:  
[create_titleliner_exe_link_with_showwindow_in_autostartfolder.bat](https://github.com/jvr-ks/titleliner/raw/main/create_titleliner_exe_link_with_showwindow_in_autostartfolder.bat), or  
take a look at the project [startdelayed](https://github.com/jvr-ks/startdelayed). 
  
or clone the [titleliner repository](https://github.com/jvr-ks/titleliner.git) .  
  
**Directory must be writable by the app!**  
  
**Be shure to use only one of the "titleliner.exe"-files at a time!**  

#### Configuration-file "titleliner.ini"  
 
Section: [setup]  
titleLineLength  
The target length of the generated line, default is 77 characters.  
  
Section: [hotkeys]  
menuHotkey="!l" ; Alt + l (Insert hotkey if pressed while Titleliner window is open)
autoInsDelHotkey="+!l"   ; Shift + Alt + l
exitHotkey="^!l" ; Ctrl + Alt + l
The operation hotkey, [autohotkey](https://www.autohotkey.com/docs/Hotkeys.htm) notation.  
  
Section: [commentChar]  
commentChar1=";"
commentChar2="//"
commentChar3="#"
commentChar4="rem "
commentChar5="@rem "
commentChar6="-"
commentChar7="-"
commentChar8="-" 
  
commentCharSelected=1  
 
Up to 8 Comment-Characters definitions, ";" is autohotkey, "//" is Java/Scala etc.  
"-" means not used!  
(Restart Titleliner if commentCharX are changed.  
  
commentCharSelected is set by the app radio button selection.    
   
#### License: MIT
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sub license, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Copyright (c) 2019/2020 J. v. Roos


<a name="virusscan"></a>

##### Virusscan at Virustotal 
[Virusscan at Virustotal, titleliner.exe 64bit-exe, Check here](https://www.virustotal.com/gui/url/fb73a10e9896bee9f1460f35f93ac42868449e8cd71fad3e2a6bd539361bc134/detection/u-fb73a10e9896bee9f1460f35f93ac42868449e8cd71fad3e2a6bd539361bc134-1727270499
)  
[Virusscan at Virustotal, titleliner32.exe 32bit-exe, Check here](https://www.virustotal.com/gui/url/1791d824edc3f0babd5d0a45502339ad9eecc0b704dfc5e30b0b557e83b44790/detection/u-1791d824edc3f0babd5d0a45502339ad9eecc0b704dfc5e30b0b557e83b44790-1727270500
)  
)  
Use [CTRL] + Click to open in a new window! 
