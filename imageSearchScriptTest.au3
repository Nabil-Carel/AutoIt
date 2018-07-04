#include <ImageSearch.au3>

MsgBox(0,"","started")
sleep(5000)
global $y = 0, $x = 0
MsgBox(0,"","started 1")
Local $search = _ImageSearch("chromeIcon.bmp", 1, $x, $y, 0)
;Local $search = _ImageSearch("chromeIcon.bmp", 0, $x, $y, 50)
MsgBox(0,"",$search)
If $search = 1 Then
   MsgBox(0,"","started 3")
   MouseMove($x, $y, 50)
EndIf
MsgBox(0,"","started 4")
MsgBox(0,"","end")
