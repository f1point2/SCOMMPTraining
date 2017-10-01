param
(
[string]$FolderPath
)



$files=Get-ChildItem -Path "$FolderPath" -Recurse | where {$_.psIsContainer -eq $false}
if ($files -ne $null) {$count = $files.count}
else {$count=0}


Write-Host $count