/*
 *********************************************************************************
 * 
 * titleliner.ahk
 * 
 * Version -> appVersion
 * 
 * License: see Licenses.txt
 *
 * Copyright (c) 2021/2023 jvr.de. All rights reserved.
 *
 *********************************************************************************
*/

#NoEnv
#Warn
#SingleInstance, force
#Persistent

; #Include Lib\ahk_common.ahk

bit := (A_PtrSize=8 ? "64" : "32")
if(InStr(A_ScriptName,"A32") > 0)
  bit := "A32"

FileEncoding, UTF-8-RAW

SetTitleMatchMode, 2

wrkDir := A_ScriptDir . "\"

appName := "Titleliner"
appnameLower := "titleliner"
appExtension := ".exe"
appVersion := "0.067"

bit := (A_PtrSize=8 ? "64" : "32")

if (!A_IsUnicode)
  bit := "A" . bit

bitName := (bit="64" ? "" : bit)

app := appName . " " . appVersion . " " . bit . "-bit"

titleLineLengthDefault := 77
clipSave := ""
clipLength := 0
titleContent := ""

commentCharSelected := 1
commentCharSelectedMax := 8

overwriteMode := false

wrkDir := A_ScriptDir . "\"
iniFile := resolvepath("titleliner.ini")
menuhotkeyDefault := "!l" ; Alt + l
menuhotkey := menuhotkeyDefault

overwriteHotkeyDefault := "+!l" ; Shift + Alt + l
overwriteHotkey := overwriteHotkeyDefault

exithotkeyDefault := "^!l" ; Ctrl + Alt + l
exitHotkey := exithotkeyDefault

server := "https://github.com/jvr-ks/" . appnameLower . "/raw/main/"
downLoadURL := server . appnameLower . bitName . appExtension
downLoadFilename := appnameLower . ".exe.tmp"
restartFilename := "restart.bat"
downLoadURLrestart := server . restartFilename

msgDefault := ""

notepadpathDefault := "C:\Windows\notepad.exe"
; overwritten by Config-file
notepadpath := notepadpathDefault

fontDefault := "Calibri"
font := fontDefault

fontsizeDefault := 10
fontsize := fontsizeDefault

hideOnStartup := true

Loop % A_Args.Length()
{
  if(eq(A_Args[A_index],"remove"))
    exit()
  
  if(eq(A_Args[A_index],"hidewindow")){
    hideOnStartup := true
  }
  
  if(eq(A_Args[A_index],"showwindow")){
    hideOnStartup := false
  }
}

if (hideOnStartup){
  tipTop(app . " started, hotkey is: " . hotkeyToText(menuHotkey),1, 4000)
  readIni()
  mainWindow(true)
} else {
  readIni()
  mainWindow()
}

return
;---------------------------------- readIni ----------------------------------
readIni(){
  global menuHotkey
  global menuhotkeyDefault
  global overwriteHotkeyDefault
  global overwriteHotkey
  global exitHotkey
  global exithotkeyDefault
  global iniFile

  global commentChar1, commentChar2, commentChar3, commentChar4
  global commentChar5, commentChar6, commentChar7
  global commentChar8, commentChar9
  global commentCharSelected
  global commentCharSelectedMax
  global titleLinelengthDefault
  global titleLinelength
  global notepadpath
  global notepadpathDefault
  
  IniRead, menuHotkey, %iniFile%, hotkeys, menuHotkey, %menuhotkeyDefault%
  if (InStr(menuHotkey, "off") > 0){
    s := StrReplace(menuHotkey, "off" , "")
    Hotkey, %s%, exit, off
  } else {
    Hotkey, %menuHotkey%, lineTitleWithSave
  }
  
  IniRead, overwriteHotkey, %iniFile%, hotkeys, overwriteHotkey, %overwriteHotkeyDefault%
  if (InStr(overwriteHotkey, "off") > 0){
    s := StrReplace(overwriteHotkey, "off" , "")
    Hotkey, %s%, exit, off
  } else {
    Hotkey, %overwriteHotkey%, lineTitleWithSaveDel
  }
  
  IniRead, exitHotkey, %iniFile%, hotkeys, exithotkey , %exithotkeyDefault%
  if (InStr(exitHotkey, "off") > 0){
    s := StrReplace(exitHotkey, "off" , "")
    Hotkey, %s%, exit, off
  } else {
    Hotkey, %exitHotkey%, exit
  }
  
  emptyDefault := "-"
  IniRead, commentChar1, %iniFile%, commentChar, commentChar1,%emptyDefault%
  IniRead, commentChar2, %iniFile%, commentChar, commentChar2,%emptyDefault%
  IniRead, commentChar3, %iniFile%, commentChar, commentChar3,%emptyDefault%
  IniRead, commentChar4, %iniFile%, commentChar, commentChar4,%emptyDefault%
  IniRead, commentChar5, %iniFile%, commentChar, commentChar5,%emptyDefault%
  IniRead, commentChar6, %iniFile%, commentChar, commentChar6,%emptyDefault%
  IniRead, commentChar7, %iniFile%, commentChar, commentChar7,%emptyDefault%
  IniRead, commentChar8, %iniFile%, commentChar, commentChar8,%emptyDefault%
  
  commentChar9 := ""
  
  IniRead, commentCharSelected, %iniFile%, commentChar, commentCharSelected,1
  
  IniRead, titleLineLength, %iniFile%, setup, titleLineLength,%titleLineLengthDefault%
  
  IniRead, notepadpath, %iniFile%, setup, notepadpath, %notepadpathDefault%
  
  IniRead, notepadPathNppp, %iniFile%, setup, notepadPathNppp, %A_Space%
  
  if (notepadPathNppp!= "")
    if (FileExist(notepadPathNppp))
      notepadpath := notepadPathNppp
  
  return
}
;-------------------------------- mainWindow --------------------------------
mainWindow(hide := false){
  global iniFile
  global app
  global appName
  global font
  global fontsize
  
  global menuHotkey
  global overwriteHotkey
  global exitHotkey

  global Text1
  global Text2
  global commentChar1
  global commentChar2
  global commentChar3
  global commentChar4
  global commentChar5
  global commentChar6
  global commentChar7
  global commentChar8
  global commentChar9
  global commentCharSelected
  global commentCharSelectedMax
  global msgDefault
  global bit
  global hMain, guiMain

  Gui, guiMain:Destroy
  Gui, guiMain:New, +LastFound hwndhMain, %app%
  
  Gui, guiMain:Font, s%fontsize%, %font%
  
  Gui, guiMain:Add, StatusBar, -Theme +BackgroundSilver
  
  Menu, Tray, UseErrorLevel 
  Menu, MainMenu, DeleteAll
  Menu, MainMenuEdit, DeleteAll
  Menu, MainMenuUpdate, DeleteAll
  
  Menu, MainMenuEdit, Add, Edit Configuration-file: "%iniFile%", editIniFile
  
  Menu, MainMenuUpdate, Add, Check if new version is available, checkUpdate
  Menu, MainMenuUpdate, Add, Start updater, startUpdate
  
  Menu, MainMenu, Add, Insert, doInsert
  
  Menu, MainMenu, Add, Overwrite, doOverwrite
  
  Menu, MainMenu, Add, Edit, :MainMenuEdit

  Menu, MainMenu,Add, Github, openGithubPage
  
  Menu, MainMenu, Add, Update, :MainMenuUpdate
  
  Menu, MainMenu, Add, Kill %appName%, exit
    
  Gui, guiMain:Font, s11, Calibri
  Gui, guiMain:Color, cF0F0F0
  
  xStart := 5
  xStart1 := 200
  
  yPos := 5
  deltaY := 15
  
  Gui, guiMain:Add, Text, x%xStart% y%yPos% , Select comment-character(s):
  
  if (commentChar1 != "-"){
    Gui, guiMain:Add, Radio, x%xStart1% y%yPos% gSaveSelectedcommentChar vcommentCharSelected,%commentChar1%
    yPos := yPos + deltaY
  }
    
  if (commentChar2 != "-"){
    Gui, guiMain:Add, Radio, x%xStart1% y%yPos% gSaveSelectedcommentChar,%commentChar2%
    yPos := yPos + deltaY
  }
  
  if (commentChar3 != "-"){
    Gui, guiMain:Add, Radio, x%xStart1% y%yPos% gSaveSelectedcommentChar,%commentChar3%
    yPos := yPos + deltaY
  }
  
  if (commentChar4 != "-"){
    Gui, guiMain:Add, Radio, x%xStart1% y%yPos% gSaveSelectedcommentChar,%commentChar4%
    yPos := yPos + deltaY
  }
  
  if (commentChar5 != "-"){
    Gui, guiMain:Add, Radio, x%xStart1% y%yPos% gSaveSelectedcommentChar,%commentChar5%
    yPos := yPos + deltaY
  }
  
  if (commentChar6 != "-"){
    Gui, guiMain:Add, Radio, x%xStart1% y%yPos% gSaveSelectedcommentChar,%commentChar6%
    yPos := yPos + deltaY
  }
  
  if (commentChar7 != "-"){
    Gui, guiMain:Add, Radio, x%xStart1% y%yPos% gSaveSelectedcommentChar,%commentChar7%
    yPos := yPos + deltaY
  }
  
  if (commentChar8 != "-"){
    Gui, guiMain:Add, Radio, x%xStart1% y%yPos% gSaveSelectedcommentChar,%commentChar8%
    yPos := yPos + deltaY
  }
  
  yPos := yPos + deltaY
  Gui, guiMain:Add, Radio, x%xStart1% y%yPos% gSaveSelectedcommentChar,None

  showHotkeyText := hotkeyToText(menuHotkey)
  showHotkeyText1 := hotkeyToText(overwriteHotkey)
  
  txt1 := "Select the title word(s) first, then press to insert: " . showHotkeyText . "`nor to overwrite: " . showHotkeyText1 . " two times,`nfirst pressing opens the Titleliner-window, second pressing performs the operation!`n(Release all keys in between!)"
  txt2 := "App started, use the hotkey " . hotkeyToText(menuHotkey) . " to operate!"
  startX := 5
  startY := yPos + deltaY
  deltaY := 20
  deltaY1 := 18
  deltaY2 := 65
  guiWidth := 580
  
  Gui, guiMain:Add, Text,w%guiWidth% x%startX% y%startY%,Clipboard now contains:
  
  Gui, guiMain:Add, Edit,vText2 w%guiWidth% r3 x%startX% yp+%deltaY1%,%txt2%

  Gui, guiMain:Add, Text,vText1 w%guiWidth% x%startX% yp+%deltaY2% ,%txt1%

  
  Gui, guiMain:Menu, MainMenu

  commentCharSelected := Min(commentCharSelected, commentCharSelectedMax)
  GuiControl,, Button%commentCharSelected%,1
  
  showMessage("","")
  
  if (!hide){
    setTimer,checkFocus,delete
    setTimer,checkFocus,3000
    Gui, guiMain:Show, Autosize center,%app%
    
    ;setDefaultFocus()
  }
    
  return
}

;-------------------------------- showWindow --------------------------------
showWindow(){
  global app
  
  setTimer,checkFocus,delete
  setTimer,checkFocus,3000
  Gui, guiMain:Show, Autosize center,%app%
  
  setTimer,setDefaultFocus,-1000
  
  return
}
;-------------------------------- hideWindow --------------------------------
hideWindow(){
  
  setTimer,checkFocus,delete
  Gui,guiMain:Hide

  return
}
;------------------------------ setDefaultFocus ------------------------------
setDefaultFocus(){
  global Text2

  GuiControl, Focus, Text2
  
  return
}
;-------------------------------- checkFocus --------------------------------
checkFocus(){
  global hMain

  if (hMain != WinActive("A")){
    hideWindow()
  }
  
  return
}
;-------------------------- SaveSelectedcommentChar --------------------------
SaveSelectedcommentChar(){
  global commentCharSelected
  global iniFile
  ;global clipSave
  
  Gui, guiMain:Submit, NoHide

  if (commentCharSelected == "")
    commentCharSelected := 9
    
  IniWrite, %commentCharSelected%, %iniFile%, commentChar, commentCharSelected

  ;clipboard := clipSave
  
  lineTitle()
  
  setDefaultFocus()

  return
}
;--------------------------- lineTitleWithSaveDel ---------------------------
; Hotkey entrypoint
lineTitleWithSaveDel(){
  global overwriteMode
  
  overwriteMode := true
  lineTitleWithSave()

  return
}
;----------------------------- lineTitleWithSave -----------------------------
; Hotkey entrypoint
lineTitleWithSave(){
  global clipSave, clipLength
  global app
  global overwriteMode
  
    if (WinActive(app)){
      if (overwriteMode)
        doOverwrite()
      else
        doInsert()        
    } else {
      ;save only when called by hotkey
      clipboard := ""
      Send {Ctrl down}c{Ctrl up}
      
      ClipWait, 1
      if ErrorLevel {
        clipSave := ""
        clipLength := 0
      } else {
        clipSave := clipboard
        clipSave := trim(RegExReplace(clipSave, "[`n`r]", " "))
        clipSave := trim(RegExReplace(clipSave, "[ ]{2,}", " "))
        clipLength := StrLen(clipSave)
        ;msgbox, %clipSave%  (%clipLength%)
      }
      lineTitle()
    }
    
  return
}
;--------------------------------- lineTitle ---------------------------------
; entrypoint after commentCharSelected change
lineTitle(){
  global commentChar1, commentChar2, commentChar3, commentChar4
  global commentChar5, commentChar6, commentChar7
  global commentChar8, commentChar9
  global commentCharSelected

  theCommentChar := ""

  if (commentCharSelected != 0){
    theCommentChar := commentChar%commentCharSelected%
  } else {
    theCommentChar := ";"
  }
  
  lineTitleGenerate(theCommentChar)
    
  return
}
;----------------------------- lineTitleGenerate -----------------------------
lineTitleGenerate(theCommentChar){
  global titleLineLength
  global clipSave, clipLength, titleContent
  
  s := clipSave
  distanceChar := " "
  
  if(clipLength == 0){
    distanceChar := "-"
  }
  
  sl:= clipLength
  sl := sl + 2
  dotlength := Floor((titleLineLength - sl)/2)

  titleContent := theCommentChar . JEE_StrRept("-", dotlength)
  titleContent := titleContent  . distanceChar . s . distanceChar

  titleContent := titleContent . JEE_StrRept("-", dotlength)

  GuiControl, guiMain:, Text2, %titleContent%
  
  showWindow()
    
  return
}
;-------------------------------- doOverwrite --------------------------------
doOverwrite(){
  global titleContent, clipLength
  global overwriteMode

  hideWindow()
  
  clipboard := titleContent
  
  ;SendInput,{Delete}{Ctrl down}v{Ctrl up}
  
  
  if (clipLength > 0){
    SendInput,{Delete}{Ctrl down}v{Ctrl up}
  } else {
    SendInput,{Ctrl down}v{Ctrl up}{Enter}
  }
  
  overwriteMode := false
  
  return
}
;--------------------------------- doInsert ---------------------------------
doInsert(){
  global titleContent, clipLength
  
  hideWindow()
  
  clipboard := titleContent
  
  if (clipLength > 0){
    SendInput,{Left}{Pos1}{Enter}{Up}{Ctrl down}v{Ctrl up}
  } else {
    SendInput,{Ctrl down}v{Ctrl up}{Enter}
  }
  
  return
}
;-------------------------------- JEE_StrRept --------------------------------
JEE_StrRept(vText, vNum){
; from: https://www.autohotkey.com/boards/viewtopic.php?f=13&t=34765

  return StrReplace(Format("{:" vNum "}","")," ",vText)
}
;-------------------------------- editIniFile --------------------------------
editIniFile() {
  global hMain
  global iniFile
  global notepadpath
  global bitName
  global appName
  
  f := notepadpath . " " . iniFile
  showMessage("", "Please close the editor to refresh the menu!")
  runWait %f%,,max
  showMessage("", "")
  showWindow()
  
  showHintColored(hMain, appName . bitName . " restarts now!")
  restartAppNoupdate()

  return
}
;------------------------------ openGithubPage ------------------------------
openGithubPage(){
  global appName
  
  StringLower, name, appName
  Run https://github.com/jvr-ks/%name%
  return
}
;-------------------------------- startUpdate --------------------------------
startUpdate(){
  global wrkdir
  global appname
  global bitName

  updaterExeVersion := "updater" . bitName . ".exe"
  
  if(FileExist(updaterExeVersion)){
    msgbox,Starting "Updater" now, please restart "%appname%" afterwards!
    run, %updaterExeVersion% runMode
    exit()
  } else {
    msgbox, Error, Updater executable not found!
  }
  
  showWindow()

  return
}
;---------------------------------- tipTop ----------------------------------
tipTop(msg, n := 1, t := 4000){

  s := StrReplace(msg,"^",",")
  
  toolX := round(A_ScreenWidth / 2)
  toolY := 2

  CoordMode,ToolTip,Screen
  
  toolTip,%s%, toolX, toolY, n
  
  WinGetPos, X,Y,W,H, ahk_class tooltips_class32

  toolX := (A_ScreenWidth / 2) - W / 2
  
  toolTip,%s%, toolX, toolY, n
  
  SetTimer, tipTopCloseAll, delete
  if (t > 0){
    tvalue := -1 * t
    SetTimer,tipTopCloseAll,%tvalue%
  }
  
  return
}
;-------------------------------- tipTopCloseAll --------------------------------
tipTopCloseAll(){
  
  Loop, 20
  {
    ToolTip,,,,%A_Index%
  }
  
  return
}
;-------------------------------- resolvePath --------------------------------
resolvePath(p){
  global wrkdir

  r := p
  if (!InStr(p, ":"))
    r := wrkdir . p

  return r
}
;------------------------------ envVariConvert ------------------------------
; envVariConvert(s){
  ; r := s
  ; if (InStr(s,"%")){
    ; s := StrReplace(s,"`%","")
    ; EnvGet, v, %s%
    ; Transform, r, Deref, %v%
  ; }

  ; return r
; }
;------------------------------------ eq ------------------------------------
eq(a, b) {
  if (InStr(a, b) && InStr(b, a))
    return 1
  return 0
}
;-------------------------------- showMessage --------------------------------
showMessage(hk1, hk2, part1 = 170, part2 = 580){
  global menuHotkey
  global exitHotkey

  SB_SetParts(part1,part2)
  if (hk1 != ""){
    SB_SetText(" " . hk1 , 1, 1)
  } else {
    SB_SetText(" " . "Hotkey: " . hotkeyToText(menuHotkey) , 1, 1)
  }
    
  if (hk2 != ""){
    SB_SetText(" " . hk2 , 2, 1)
  } else {
    SB_SetText(" " . "Exit-hotkey: " . hotkeyToText(exitHotkey) , 2, 1)
  }
  
  memory := "[" . GetProcessMemoryUsage() . " MB]      "
  SB_SetText("`t`t" . memory , 3, 2)

  return
}
;------------------------------- removeMessage -------------------------------
removeMessage(){
  global menuHotkey
  global exitHotkey

  showMessage("", "")

  return
}
;------------------------------ showHintColored ------------------------------
showHintColored(handle, s := "", n := 3000, fg := "cffffff", bg := "a900ff", newfont := "", newfontsize := ""){
  global hMain
  global font, fontsize
  
  if (newfont == "")
    newfont := font
    
  if (newfontsize == "")
    newfontsize := fontsize
  
  Gui, hintColored:new, hwndhHintColored +parentguiMain +ownerguiMain +0x80000000
  Gui, hintColored:Font, s%newfontsize%, %newfont%
  Gui, hintColored:Font, c%fg%
  Gui, hintColored:Color, %bg%
  Gui, hintColored:Add, Text,, %s%
  Gui, hintColored:-Caption
  Gui, hintColored:+ToolWindow
  Gui, hintColored:+AlwaysOnTop
  Gui, hintColored:Show
  WinCenter(hMain, hHintColored, 1)
  Sleep, n
  Gui, hintColored:Destroy
  
  return
}
;--------------------------------- WinCenter ---------------------------------
; from: https://www.autohotkey.com/board/topic/92757-win-center/
WinCenter(hMain, hChild, Visible := 1) {
    DetectHiddenWindows On
    WinGetPos, X, Y, W, H, ahk_ID %hMain%
    WinGetPos, _X, _Y, _W, _H, ahk_ID %hChild%
    If Visible {
        SysGet, MWA, MonitorWorkArea, % WinMonitor(hMain)
        X := X+(W-_W)//2, X := X < MWALeft ? MWALeft+5 : X, X := (X + _W) > MWARight ? MWARight-_W-5 : X
        Y := Y+(H-_H)//2, Y := Y < MWATop ? MWATop+5 : Y, Y := (Y + _H) > MWABottom ? MWABottom-_H-5 : Y
    } Else X := X+(W-_W)//2, Y := Y+(H-_H)//2
    WinMove, ahk_ID %hChild%,, %X%, %Y%
    WinShow, ahk_ID %hChild%
}
;-------------------------------- WinMonitor --------------------------------
WinMonitor(hMain, Center := 1) {
    SysGet, MonitorCount, 80
    WinGetPos, X, Y, W, H, ahk_ID %hMain%
    Center ? (X := X+(W//2), Y := Y+(H//2))
    loop %MonitorCount% {
      SysGet, Mon, Monitor, %A_Index%
      if (X >= MonLeft && X <= MonRight && Y >= MonTop && Y <= MonBottom)
          Return A_Index
    }
}
;--------------------------- GetProcessMemoryUsage ---------------------------
GetProcessMemoryUsage() {
    PID := DllCall("GetCurrentProcessId")
    size := 440
    VarSetCapacity(pmcex,size,0)
    ret := ""
    
    hProcess := DllCall( "OpenProcess", UInt,0x400|0x0010,Int,0,Ptr,PID, Ptr )
    if (hProcess)
    {
        if (DllCall("psapi.dll\GetProcessMemoryInfo", Ptr, hProcess, Ptr, &pmcex, UInt,size))
            ret := Round(NumGet(pmcex, (A_PtrSize=8 ? "16" : "12"), "UInt") / 1024**2, 2)
        DllCall("CloseHandle", Ptr, hProcess)
    }
    return % ret
}
;---------------------------- restartAppNoupdate ----------------------------
restartAppNoupdate(){
  global bit
  global restartFilename
  
  run,%comspec% /k %restartFilename% %bit% noupdate
  
  exit()
}
;----------------------------------- exit -----------------------------------
exit(){
  global app
  
  tipTop(app . " will be stopped and removed from memory now!",1,3000)
  sleep,3000
  exitApp
}
;------------------------------------------------------------------------------ -











