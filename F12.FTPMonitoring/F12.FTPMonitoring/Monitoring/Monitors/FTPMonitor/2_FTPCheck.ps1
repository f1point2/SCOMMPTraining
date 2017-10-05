param($FTPPath)

$api=new-Object -comObject "MOM.ScriptAPI"
$bag= $api.CreatePropertyBag()
 
$Request=[System.Net.WebRequest]::Create($FTPPath)
 
$Request.Method = [System.Net.WebRequestMethods+Ftp]::ListDirectoryDetails
 
$Request.Credentials = New-Object System.Net.NetworkCredential $RunAs[Name="F12.FTPMonitoring.RunAsProfile"]/UserName$, $RunAs[Name="F12.FTPMonitoring.RunAsProfile"]/Password$
 
$Request.KeepAlive=0
 
$Request.UseBinary=1
 
$Response = $Request.GetResponse()
 
$ResponseStream=$Response.GetResponseStream()
 
$Reader = New-Object System.Io.StreamReader $ResponseStream
 
[System.Console]::Writeline($Reader.ReadToEnd())
 
$bag.AddValue("StatusDescription", $Response.StatusDescription)

$bag

$Reader.Close()
$Response.Close()