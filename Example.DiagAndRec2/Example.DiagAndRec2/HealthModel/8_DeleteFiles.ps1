param(
[string]$FolderPath
)

get-childitem -Path $FolderPath | foreach ($_) {remove-item $_.fullname}