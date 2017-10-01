OPTION EXPLICIT

Call Main

Sub Main()

Dim fso, folder, file, fullpath, filesize, I, thresholdvalue, ObjArgs, ObjOpsMgr, ObjBag

Set objArgs = Wscript.Arguments
' Retrieve parameters
folder = "\\DemoSCOM\c$\Temp"

' Instantiate File System Object
Set fso = CreateObject("Scripting.FileSystemObject")

' Instantiate MOM API
Set ObjOpsMgr = CreateObject("MOM.ScriptAPI")
Set ObjBag = ObjOpsMgr.CreatePropertyBag()

' Check Folder Exists
If (fso.FolderExists(folder)) Then
Call ObjBag.AddValue("FolderExists","Good")
Else
Call ObjBag.AddValue("FolderExists","Bad")
End If
' Check File Exists
ObjOpsMgr.AddItem(objBag)
Call ObjOpsMgr.ReturnItems

End Sub