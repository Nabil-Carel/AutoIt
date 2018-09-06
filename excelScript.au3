#include <Array.au3>
Global $employeeNumberArray, $numberOfSelectedLines, $employeeNumber

func clearExcel()
   Send("{CtrlDown}{Home}{CtrlUp}")
   Sleep(100)
   Send("{Right}")
   sleep(100)
   Send("{CtrlDown}{ShiftDown}{Down}{CtrlUp}{ShiftUp}")
   $numberOfSelectedLines = InputBox("Input","Enter the number of selected lines") ; String
   Sleep(100)
   $numberOfSelectedLines += 0; convert the entered string into int
   Send("{CtrlDown}{Home}{CtrlUp}")


   Local $regex = "[^\W_]+"

   For $i= $numberOfSelectedLines To 1 Step -1
	  ClipPut("")
	  Sleep(100)
	  Send("{CtrlDown}c{CtrlUp}")
	  Sleep(100)



	  Local $clipboardValue = ClipGet()
	  Sleep(100)
	  Local $regexResult = StringRegExp($clipboardValue,$regex);check if the selected case is empty
	  If $regexResult == 0 Then; if case is empty, the current number wasn't checked. delete le current line
		 Send("{ShiftDown}{Space}{ShiftUp}")
		 Sleep(100)
		 Send("{CtrlDown}{-}{CtrlUp}")
	  Else; else go to the next line

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

   $numberOfSelectedLines = InputBox("Input","Enter the number of selected lines")   ; String
   Sleep(100)
   Send("{CtrlDown}{Home}{CtrlUp}")
   Send("{Right}")
  $employeeNumberArray[ $numberOfSelectedLines]

   For $i= 0 To $numberOfSelectedLines-1 Step 1
	  Send("{CtrlDown}c{CtrlUp}")
      Sleep(100)
	  $employeeNumber = ClipGet()
	   $employeeNumber = StringRegExpReplace( $employeeNumber, '\v{1,2}$', ''); '\v{1,2}$' = new line in autoit  --   => replace new line in the string by empty character
	  sleep(100)


		 _ArrayPush ( $employeeNumberArray, $employeeNumber )
		 Send("{Down}")
		 sleep(100)

	  ;MsgBox(0,"i",$i)
   Next

   For $j= 0 To $numberOfSelectedLines-1 Step 1
	 MsgBox(0, "",$employeeNumberArray[$j])
   Next
   Sleep(100)




EndFunc

Func exitScript()
   Exit
EndFunc


MsgBox(0,"test","started")

HotKeySet("^{j}", "clearExcel")
HotKeySet("{ESC}","exitScript")
while 1
   sleep(100)
   WEnd

