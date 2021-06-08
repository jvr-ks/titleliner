/*
 *********************************************************************************
 * 
 * titleliner.ahk
 * 
 * 
 * 
 * Version -> appVersion
 * 
 * License: see Licenses.txt
 *
 * Copyright (c) 2021 jvr.de. All rights reserved.
 *
 *********************************************************************************
*/

#NoEnv
#Warn
#SingleInstance, force
#Persistent

#include %A_ScriptDir%\Lib\ahk_common.ahk

downLoadURL := "https://github.com/jvr-ks/titleliner/raw/master/titleliner.exe"
exeFilename := "titleliner.exe"
downLoadFilename := "titleliner.exe.tmp"
downLoadURLrestart64 := "https://github.com/jvr-ks/titleliner/raw/master/restart64.bat"

FileEncoding, UTF-8-RAW

OwnPID := DllCall("GetCurrentProcessId")

appName := "Titleliner"
appVersion := "0.032"
app := appName . " " . appVersion

titleLineLengthDefault := 77
clipSave := ""
autoinsert := false

commentCharSelected := 1
commentCharSelectedMax := 8

wrkDir := A_ScriptDir . "\"
iniFile := resolvepath(wrkDir,"titleliner.ini")
menuhotkeyDefault := "!l" ; Alt + l
menuhotkey := menuhotkeyDefault

msgDefault := ""

;dpiScale := "on"
activeWin := 0

fontDefault := "Calibri"
font := fontDefault

fontsizeDefault := 10
fontsize := fontsizeDefault

hasParams := A_Args.Length()

if (hasParams > 0){
	if(eq(A_Args[1],"remove"))
		exit()
		
	if (eq(StrLower(A_Args[1]),"hidewindow")){
		hktest := hotkeyToText(menuHotkey)
		tipTopTime("Started " . app . ", Hotkey is: " . hktest, 5000)
		readIni()
		mainWindow(true)
	}
} else {
		readIni()
		mainWindow()
}

return
;---------------------------------- readIni ----------------------------------
readIni(){
	global menuHotkey
	global menuhotkeyDefault
	global iniFile

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
	global titleLinelengthDefault
	global titleLinelength
	
	;IniRead, commentChar, %iniFile%, setup, commentChar , ";"
	
	IniRead, menuHotkey, %iniFile%, hotkeys, menuHotkey, %menuhotkeyDefault%

	Hotkey, %menuHotkey%, lineTitleWithSave
	
	emptyDefault := "-"
	IniRead, commentChar1, %iniFile%, commentChar, commentChar1,%emptyDefault%
	IniRead, commentChar2, %iniFile%, commentChar, commentChar2,%emptyDefault%
	IniRead, commentChar3, %iniFile%, commentChar, commentChar3,%emptyDefault%
	IniRead, commentChar4, %iniFile%, commentChar, commentChar4,%emptyDefault%
	IniRead, commentChar5, %iniFile%, commentChar, commentChar5,%emptyDefault%
	IniRead, commentChar6, %iniFile%, commentChar, commentChar6,%emptyDefault%
	IniRead, commentChar7, %iniFile%, commentChar, commentChar7,%emptyDefault%
	IniRead, commentChar8, %iniFile%, commentChar, commentChar8,%emptyDefault%
  
  // commentChar9 == ""
	commentChar9 := ""
	
	IniRead, commentCharSelected, %iniFile%, commentChar, commentCharSelected,1
	
	IniRead, titleLineLength, %iniFile%, setup, titleLineLength,%titleLineLengthDefault%
	
	return
}
;-------------------------------- mainWindow --------------------------------
mainWindow(hide := false){
	global iniFile
	global app
	global appName
	global font
	global fontsize
	
	global exitHotkey
	global menuHotkey
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
	global OwnPID


	Gui, guiMain:Destroy
	Gui, guiMain:New, +E0x08000000 +OwnDialogs +LastFound HwndhMain +owner, %app%
	
	Gui, guiMain:Font, s%fontsize%, %font%
	
	Gui, guiMain:Add, StatusBar, hwndMainStatusBarHwnd -Theme +BackgroundSilver
	
	Menu, Tray, UseErrorLevel 
	Menu, MainMenu, DeleteAll
	Menu, MainMenuEdit, DeleteAll
	
	Menu, MainMenuEdit,Add,Edit Configuration-file: "%iniFile%",editIniFile
	
	Menu, MainMenu, Add,Edit,:MainMenuEdit

	Menu, MainMenu, Add,Clear Clipboard,clearClipboard
	
	Menu, MainMenu,Add,Github webpage,openGithubPage
	
	Menu, MainMenu,Add,Update,updateApp
	
	Menu, MainMenu, Add,Kill,exit
		
	Gui, guiMain:Destroy
	
	Gui, guiMain:Font, s11, Calibri
	Gui, guiMain:Color,cF0F0F0
	
	xStart := 5
	xStart1 := 200
	
	yPos := 5
	deltaY := 15
	
	Gui, guiMain:Add,Text,x%xStart% y%yPos% ,Select comment-character(s):
	
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
	txt1 := "Please select the title word(s) and press " . showHotkeyText
	txt2 := "App started, use the hotkey " . hotkeyToText(menuHotkey) . " to operate!"
	startX := 5
	startY := yPos + deltaY
	deltaY := 20
	deltaY1 := 18
	deltaY2 := 65
	guiWidth := 500
	
	Gui, guiMain:Add, Text,w%guiWidth% x%startX% y%startY%,Clipboard now contains:
	
	Gui, guiMain:Add, Edit,vText2 w%guiWidth% r3 x%startX% yp+%deltaY1%,%txt2%

	Gui, guiMain:Add, Text,vText1 w%guiWidth% x%startX% yp+%deltaY2% ,%txt1%

	
	Gui, guiMain:Menu, MainMenu

	commentCharSelected := Min(commentCharSelected, commentCharSelectedMax)
	GuiControl,, Button%commentCharSelected%,1
	
	showMessageDefaultTitleliner()
	
	if (!hide){
		registerWindow()
		setTimer,checkFocus,3000
		Gui, guiMain:Show, Autosize center,%app%	
		
		setDefaultFocus()
	}
		
	return
}
;------------------------------ registerWindow ------------------------------
registerWindow(){
	global activeWin
	
	activeWin := WinActive("A")
	
	return
}
;-------------------------------- showWindow --------------------------------
showWindow(){
	global app
	
	setTimer,registerWindow,-500
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
	global activeWin
	global iniFile

	h := WinActive("A")
	if (activeWin != h){
		hideWindow()
	}
		
	return
}
;----------------------- showMessageDefaultTitleliner -----------------------
showMessageDefaultTitleliner(){
	global menuHotkey

	msg1 := "Open Titleliner hotkey: " . hotkeyToText(menuHotkey)
	showMessage(msg1)
	
	return
}
;------------------------------- showMessage -------------------------------
showMessage(hk1){

	memory := "[" . GetProcessMemoryUsage(DllCall("GetCurrentProcessId")) . " MB]    "

	SB_SetParts(700,170)
	SB_SetText(" " . hk1 , 1, 1)
	SB_SetText("`t" . memory , 2, 2)

	return
}
;-------------------------- SaveSelectedcommentChar --------------------------
SaveSelectedcommentChar(){
	global commentCharSelected
	global iniFile
	global clipSave
	global menuhotkey
	
	Gui, guiMain:Submit, NoHide

  if (commentCharSelected == "")
    commentCharSelected := 9
    
	IniWrite, %commentCharSelected%, %iniFile%, commentChar, commentCharSelected

	clipboard := clipSave
	
	lineTitle()
	
	setDefaultFocus()

	return
}
;------------------------------ clearClipboard ------------------------------
clearClipboard(){
	global clipSave

	Clipboard := ""
	clipSave := ""	
	r := ""
	lineTitle()
	;GuiControl,guiMain:,Text2,%r%

	return
}
;----------------------------- lineTitleWithSave -----------------------------
; Hotkey entrypoint
lineTitleWithSave(){
	global clipSave
	global app
	
		if (WinActive(app)){
			doAutoinsert()
		} else {
			;save only when called by hotkey
			clipboard := ""
			Send {Ctrl down}c{Ctrl up}
			
			cl := clipboard
			
			if (StrLen(cl) > 0)
				clipSave := clipboard
			
			lineTitle()
		}
		
	return
}
;--------------------------------- lineTitle ---------------------------------
; entrypoint after commentCharSelected change
lineTitle(){
	global titleLineLength
	global commentCharSelected
	global app
	global clipSave
	global menuhotkey
	
		StringReplace clipboard, clipboard, `r`n,, All
		cl := clipboard
		
		theCommentChar := ""

		if (commentCharSelected != 0){
			theCommentChar := commentChar%commentCharSelected%
		} else {
			theCommentChar := ";"
		}
		
		if (cl == "" || cl == " "){
			clipboard := ""
			clipSave := ""
		}
		lineTitleGenerate(theCommentChar)
		
	return
}
;----------------------------- lineTitleGenerate -----------------------------
lineTitleGenerate(theCommentChar){
	global titleLineLength
	
		s := clipboard
		distanceChar := " "
		
		if(StrLen(s) == 0){
			distanceChar := "-"
		}
		
		sl:= StrLen(s)
		sl := sl + 2
		dotlength := Floor((titleLineLength - sl)/2)

		r := theCommentChar . JEE_StrRept("-",dotlength)
		r := r  . distanceChar . s . distanceChar

		;r := r . JEE_StrRept("-",dotlength) . "`n" ; interferes with Autoinsert-feature
		r := r . JEE_StrRept("-",dotlength)
		clipboard := r

		GuiControl,guiMain:,Text2,%r%
		
		showWindow()
			
		return
}
;------------------------------- doAutoinsert -------------------------------
doAutoinsert(){
	
	hideWindow()
	
	Send,{Left}{Pos1}{Enter}{Up}{Ctrl down}v{Ctrl up}
	
	return
}
;-------------------------------- JEE_StrRept --------------------------------
JEE_StrRept(vText, vNum){
; from: https://www.autohotkey.com/boards/viewtopic.php?f=13&t=34765

	return StrReplace(Format("{:" vNum "}","")," ",vText)
	;return StrReplace(Format("{:0" vNum "}",0),0,vText)
}
;-------------------------------- editIniFile --------------------------------
editIniFile() {
	global iniFile
	global notepadpath
	global appname
	
	f := iniFile
	showMessage("Please close the editor to refresh the menu!")
	runWait %f%,,max
	showMessageDefaultTitleliner()
	msgbox, A restart of %appname% is required!

	run,%comspec% /k restart64.bat

	ExitApp

	return
}
;------------------------------ openGithubPage ------------------------------
openGithubPage(){
	global appName
	
	StringLower, name, appName
	Run https://github.com/jvr-ks/%name%
	return
}
;----------------------------------- exit -----------------------------------
exit(){
	global app
	
	Guicontrol,guiMain:,Text1,%app% will be stopped and removed from memory now!
	sleep,2000
	exitApp
}
;--------------------------------- updateApp ---------------------------------
updateApp(){
	global appVersion
	global msgDefault
	global downLoadURL
	global exeFilename
	global downLoadFilename
	global downLoadURLrestart64
	
	vers := getVersionFromGithub()
	if (vers != "unknown"){
		if (vers > appVersion){
			msg := "This is: " . appVersion . ", available on Github is: " . vers . " update now?"
			MsgBox , 1, Update available!, %msg%
			IfMsgBox, OK
				{
					;restart64.bat can contain update hints!
					FileDelete, restart64.bat
					UrlDownloadToFile, %downLoadURLrestart64%, restart64.bat
					sleep,1000
					
					FileDelete, %downLoadFilename%
					UrlDownloadToFile, %downLoadURL%, %downLoadFilename%
					
					if FileExist(downLoadFilename){
						run,%comspec% /k restart64.bat
						sleep,1000
						exitApp
					} else {
						msgbox,Could not download update!
					}
				}
		} else {
			msgbox, This version: %appVersion%, available version %vers%, no update available!
		}
	}

}
;- ----------------------------------------------------------------------------- -











