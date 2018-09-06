#include <ImageSearch.au3>

MsgBox(0,"","started")
sleep(5000)
 $y = 0
 $x = 0
MsgBox(0,"","started 1")
Local $search = _ImageSearch("chrome.bmp", 1, $x, $y, 0)
;Local $search = _ImageSearch("chromeIcon.bmp", 0, $x, $y, 50)
MsgBox(0,"",$search)
If $search = 1 Then
   MsgBox(0,"","started 3")
   MouseMove($x, $y, 50)
EndIf

;Global $searchX = 0
;Global $searchY = 0
;Global yesButton = _ImageSearch("chrome.bmp",1,$searchX,$searchY,0)
;MsgBox(0,"","started 4")
;MsgBox(0,"","end")
