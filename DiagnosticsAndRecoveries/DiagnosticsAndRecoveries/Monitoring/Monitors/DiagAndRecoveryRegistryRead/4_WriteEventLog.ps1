Param (
$Version
)

If ([System.Diagnostics.EventLog]::SourceExists("Diagnostic and Recovery PowerShell") -eq $False) {
New-EventLog -LogName Application -Source "Diagnostic and Recovery PowerShell"
}

$Msg = 
"Recovery in response to Diagnostic Has Completed - Version = $Version" 
Write-EventLog -LogName Application -Source "Diagnostic and Recovery PowerShell" -EntryType Information -EventID 2345 -Message $Msg 