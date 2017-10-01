$Version = Get-ItemProperty "hklm:\SOFTWARE\SCOMDiscoveryData\Diagnostic" -Name Version | Select -ExpandProperty Version 


$api = New-Object -ComObject 'MOM.ScriptAPI'
$api.LogScriptEvent('DiagnotsicReadReg.ps1',101,4,$Version)

$bag=$api.createpropertybag()
$bag.AddValue('Version',$Version)
$bag