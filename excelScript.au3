
Global $dataArray, $numberOfSelectedLines, $dataString

func clearExcel()
   Send("{CtrlDown}{Home}{CtrlUp}")
   Sleep(100)
   Send("{CtrlDown}{ShiftDown}{Down}{CtrlUp}{ShiftUp}")
   $numberOfSelectedLines = InputBox("Input","Enter the number of selected lines") ; String
   Sleep(100)
   $numberOfSelectedLines += 0
   Send("{Right 5}")
   Local $regex = "[^\W_]+"

   For $i= $numberOfSelectedLines To 1 Step -1
	  ClipPut("")
	  Sleep(100)
	  Send("{CtrlDown}c{CtrlUp}")
	  Sleep(100)



	  Local $clipboardValue = ClipGet()
	  Sleep(100)
	  Local $regexResult = StringRegExp($clipboardValue,$regex)
	  If $regexResult == 0 Then
		 Send("{ShiftDown}{Space}{ShiftUp}")
		 Sleep(100)
		 Send("{CtrlDown}{-}{CtrlUp}")
	  Else

		 ;MsgBox(0,"clip",$regexResult)
		 Sleep(100)
		 Send("{Down}")
	  EndIf
   Next

   ClipPut("")
   Sleep(50)
   Send("{CtrlDown}{Home}{CtrlUp}")
   Sleep(50)
   Send("{CtrlDown}{ShiftDown}{Down}{CtrlUp}{ShiftUp}")
   Sleep(50)
   ;$numberOfSelectedLines = InputBox("Input","Enter the number of selected lines")   ; String
   ;Sleep(50)
   ;Send("{CtrlDown}c{CtrlUp}")
   ;Sleep(50)
    ;Run("notepad.exe")
   ;Local $hWnd = WinWait("Untitled - Notepad", "", 10)
   ;Sleep(50)
  ; FileWrite($hWnd, ClipGet())
   ;sleep(1000)
   ;clipput("!@#:")
  ; MsgBox(0,'',StringLen(clipget()))


  ; for $i = 1 to $numberOfSelectedLines
	 ; $line = FileReadLine($hWnd,$i)
	  ;MsgBox(0,"line",$line)
  ; Next

   ;Local $transfferedFiles = ClipGet()
   $numberOfSelectedLines = InputBox("Input","Enter the number of selected lines")   ; String
   Sleep(50)
   Send("{CtrlDown}{Home}{CtrlUp}")
   $dataArray = ""

   For $i= $numberOfSelectedLines To 1 Step -1
	  Send("{CtrlDown}c{CtrlUp}")
      Sleep(50)
	  $dataString &= ClipGet()

	  if $i > 1 Then
		 $dataString &= ","
		 Send("{Down}")
	  EndIf
	  ;MsgBox(0,"i",$i)
   Next
   Sleep(100)
   MsgBox(0, "",$dataString)
   Sleep(100)
   $dataArray = StringSplit($dataString,",")

   ;Local $data = StringToASCIIArray($dataArray[1])

   For $i= 1 To $numberOfSelectedLines Step 1
	  $dataArray[$i] = StringRegExpReplace($dataArray[$i], '\v{1,2}$', '')
	 MsgBox(0,"",StringLen($dataArray[$i]))
  Next

  For $i= 0 To 10 Step 1
	  ;StringStripWS($dataArray[$i],8)
	; MsgBox(0,"ascii",StringLen($data[$i]))
   Next



  ; MsgBox(0,"",Ubound($dataArray) - 1)




   Exit
EndFunc
sleep(5000)
MsgBox(0,"test","started")

HotKeySet("^{j}", "clearExcel")
;Send("+{Space}")
Sleep(5000)
;Send("^{Home}")
;Send("^+{Down}")
;FileOpen("ClasseurTest.xlsx")
WinWaitActive("ClasseurTest.xlsx - Excel","waiting for excel")
;Global $oExcel = _Excel_Open()
;Global $oWorkbook = _Excel_BookOpen($oExcel, "ClasseurTest.xlsx")
Sleep(5000)
Send("^j")
RunWait("Exit")
