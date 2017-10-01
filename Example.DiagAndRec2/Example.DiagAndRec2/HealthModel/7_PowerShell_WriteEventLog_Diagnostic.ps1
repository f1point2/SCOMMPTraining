
Param (
[int]$FileCount
)

If ([System.Diagnostics.EventLog]::SourceExists("Diagnostic PowerShell") -eq $False) {
New-EventLog -LogName Application -Source "Diagnostic PowerShell"
}

$Msg = "Diagnostic has completed for file count = $FileCount" 
Write-EventLog -LogName Application -Source "Diagnostic PowerShell" -EntryType Information -EventID 234 -Message $Msg 