# Titleliner ![Icon](https://github.com/jvr-ks/titleliner/blob/master/titleliner.png?raw=true)

Small tool making (64bit exe only) creating a divider like:  
";------------- title -------------"  
or
"/------------- title -------------"  
etc.  
from marked "title" via the clipboard. 

#### Operation
Start the app, running in the background.  
Select the text, press the hotkey (Alt + l is default).  
  
 
#### Remark
there are some false positiv virus detections,  
Windows Defender detects it as a virus too (sometimes)!  
Viruscheck at Virustotal see at the end of this page.  
I did not report the false-positives to Microsoft,  
because the development has not finished yet.  
  
#### Latest changes  
* Super simple app-update mechanism via "restart64.bat"
* A newline is added to the generated divider!
* Self remove from memory: titleliner.exe remove 
* Comment characters 1 to 8 (defined in the Configuration-file: "titleliner.ini") are selectable via radio buttons.  
* If nothing is selected, an "empty" divider is generated.  
  
#### Download 
(Right-click ... save as ... to download)  
  
from github, these files are essential:   
[titleliner.exe](https://github.com/jvr-ks/titleliner/raw/master/titleliner.exe)  
and   
[titleliner.ini](https://github.com/jvr-ks/titleliner/raw/master/titleliner.ini)   
and  
[restart64.bat](https://github.com/jvr-ks/titleliner/raw/master/restart64.bat)   
optional  
[create_titleliner_exe_link_with_hidewindow_in_autostartfolderBatchfile.bat](https://github.com/jvr-ks/titleliner/raw/master/create_titleliner_exe_link_with_hidewindow_in_autostartfolder.bat) 

or clone the [titleliner repository](https://github.com/jvr-ks/titleliner.git) .  
  
**Directory must be writable by the app!**  
("titleliner.ini" is used to store selection of comment-character).  
   
#### License: MIT
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sub license, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Copyright (c) 2019/2020 J. v. Roos


##### Viruscheck at Virustotal 
[Check here](https://www.virustotal.com/gui/url/feae6aae34b2054ddaf4369ae8c3830fc9a147ddcd3cbec0619d5079463c5c4a/detection/u-feae6aae34b2054ddaf4369ae8c3830fc9a147ddcd3cbec0619d5079463c5c4a-1622113519
)  
Use [CTRL] + Click to open in a new window! 
