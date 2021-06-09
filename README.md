# Titleliner ![Icon](https://github.com/jvr-ks/titleliner/blob/master/titleliner.png?raw=true)

Small tool making creating a divider like:  
";------------- title -------------"  
or  
"/------------- title -------------"  
etc.  
from marked "title" via the clipboard. 

#### Operation
Start the app, app is running in the background.  
Select the text and then press the hotkey (Alt + l is default).  
  
 
#### Remarks
* There are some false positiv virus detections (64-bit exe only)  
[Virusscan](#virusscan) at Virustotal see below.  
  
#### Latest changes  
* Autoinsert: Press hotkey again while Titleliner-window is open  
* Newlines are always removed from title-input (to use triple-click in np++)  
* Super simple app-update mechanism via "restart64.bat"  
* ~~A newline is added to the generated divider!~~ removed because it interferes with new Autoinsert-feature  
* Self remove from memory: titleliner.exe remove  
* Comment characters 1 to 8 (defined in the Configuration-file: "titleliner.ini") are selectable via radio buttons.  
* If nothing is selected, an "empty" divider is generated.  
  
#### Download 
(Right-click ... save as ... to download)  
  
from github, these files are essential:   
[titleliner.exe 64bit](https://github.com/jvr-ks/titleliner/raw/master/titleliner.exe)  
or  
[titleliner.exe 32bit](https://github.com/jvr-ks/titleliner/raw/master/titleliner32.exe)  
or  
[titleliner.exe 32bit ANSI](https://github.com/jvr-ks/titleliner/raw/master/titlelinerA32.exe)  
and   
[titleliner.ini](https://github.com/jvr-ks/titleliner/raw/master/titleliner.ini)   
and  
[restart64.bat](https://github.com/jvr-ks/titleliner/raw/master/restart64.bat)   
optional  
[create_titleliner_exe_link_with_hidewindow_in_autostartfolderBatchfile.bat](https://github.com/jvr-ks/titleliner/raw/master/create_titleliner_exe_link_with_hidewindow_in_autostartfolder.bat) 

or clone the [titleliner repository](https://github.com/jvr-ks/titleliner.git) .  
  
**Directory must be writable by the app!**  
  
**Be shure to use only one of the *.exe at a time!**  

#### Configuration-file "titleliner.ini"  
 
Section: [setup]  
titleLineLength  
The target length of the generated line, default is 77 characters.  
  
Section: [hotkeys]  
menuHotkey="!l"  
The operation hotkey, [autohotkey](https://www.autohotkey.com/docs/Hotkeys.htm) notation.  
  
Section: [commentChar]  
commentChar1=";"  
commentChar2="//"  
commentChar3="#"  
commentChar4="-"  
commentChar5="-"  
commentChar6="-"  
commentChar7="-"  
commentChar8="-"  
  
commentCharSelected=1  
  
Up to 8 Comment-Characters definitions, ";" is autohotkey, "//" is Java/Scala etc.  
"-" means not used!  
  
commentCharSelected is set by the app radio button selection.    
   
#### License: MIT
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sub license, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Copyright (c) 2019/2020 J. v. Roos


<a name="virusscan"></a>

##### Virusscan at Virustotal 
[Virusscan at Virustotal, titleliner.exe 64bit-exe, Check here](https://www.virustotal.com/gui/url/feae6aae34b2054ddaf4369ae8c3830fc9a147ddcd3cbec0619d5079463c5c4a/detection/u-feae6aae34b2054ddaf4369ae8c3830fc9a147ddcd3cbec0619d5079463c5c4a-1623250313
)  
[Virusscan at Virustotal, titleliner32.exe 32bit-exe, Check here](https://www.virustotal.com/gui/url/4ab1c10fc7391755e32321c2a6b37f73cb66a0f1aebb696a6b3f10eca6110f39/detection/u-4ab1c10fc7391755e32321c2a6b37f73cb66a0f1aebb696a6b3f10eca6110f39-1623250313
)  
[Virusscan at Virustotal, titlelinerA32.exe 32bit-exe ANSI, Check here](https://www.virustotal.com/gui/url/4461b7965dcdd0b1f6f3d725270b941ba8a1a5edd12a462938585e7e184d9027/detection/u-4461b7965dcdd0b1f6f3d725270b941ba8a1a5edd12a462938585e7e184d9027-1623250314
)  
Use [CTRL] + Click to open in a new window! 
