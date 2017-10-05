param($FTPPath)





$api=new-Object -comObject "MOM.ScriptAPI"
$bag= $api.CreatePropertyBag()

$Request=[System.Net.WebRequest]::Create($FTPPath)
 
$Request.Method = [System.Net.WebRequestMethods+Ftp]::ListDirectoryDetails
 
 $Request.Credentials = New-Object System.Net.NetworkCredential $RunAs[Name="F12.FTPMonitoring.RunAsProfile"]/UserName$, $RunAs[Name="F12.FTPMonitoring.RunAsProfile"]/Password$, $RunAs[Name="F12.FTPMonitoring.RunAsProfile"]/Domain$
# $Request.Credentials = New-Object System.Net.NetworkCredential ("anonymous","here@there.com")


$api.logscriptevent("FTPCheck.ps1",999,0, "Script Run") 

$Request.KeepAlive=0
 
$Request.UseBinary=1
 
Try
{ 

$Response = $Request.GetResponse()
 
$ResponseStream=$Response.GetResponseStream()
 
$Reader = New-Object System.Io.StreamReader $ResponseStream
 
[System.Console]::Writeline($Reader.ReadToEnd())
 
$bag.AddValue("StatusDescription", $Response.StatusDescription)

}

Catch
{ 
$ErrorMessage = $_.Exception.Message
$bag.AddValue("StatusDescription", $ErrorMessage)
}

$bag

$Reader.Close()
$Response.Close()