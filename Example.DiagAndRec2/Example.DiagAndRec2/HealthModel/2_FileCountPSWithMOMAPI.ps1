param
(
[string]$FolderPath,
[int]$WarningThreshold,
[int]$CriticalThreshold
)


$files=Get-ChildItem -Path "$FolderPath" -Recurse | where {$_.psIsContainer -eq $false}
if ($files -ne $null) {$count = $files.count}
else {$count=0}


#Setup the objects
$api=New-Object -comObject 'MOM.ScriptAPI'
$api.LogScriptEvent('Count =',80,0,$count)
$api.LogScriptEvent('Folder Path =',81,0,$folderpath)


$bag=$api.CreatePropertyBag()

#Add name / value pairs

$bag.AddValue('FileCount',$count)
$bag.AddValue('WarningThreshold',$WarningThreshold)
$bag.AddValue('CriticalThreshold',$CriticalThreshold)
$bag.AddValue('FolderPath',$FolderPath)


#Return property bag
$bag

# Testing
#$api.Return($bag)

