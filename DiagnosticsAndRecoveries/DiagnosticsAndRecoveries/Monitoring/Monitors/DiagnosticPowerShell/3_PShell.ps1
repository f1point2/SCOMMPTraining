if ([System.Diagnostics.EventLog]::SourceExists("Diagnostic PowerShell") -eq $False) {
    New-EventLog -LogName "Visual Studio Builds" -Source "Diagnostic PowerShell"
	}

Write-EventLog -LogName Application -Source "Diagnostic PowerShell" -EntryType Information -EventID 1234 -Message "Diagnostic Has Completed"