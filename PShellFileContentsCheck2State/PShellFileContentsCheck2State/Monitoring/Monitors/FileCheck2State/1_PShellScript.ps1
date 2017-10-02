
$Path = "C:\LogFileApp\Output.txt"

#Setup the objects
$api=New-Object -comObject 'MOM.ScriptAPI'
$bag=$api.CreatePropertyBag()

if(![System.IO.File]::Exists($path)){
    $bag.AddValue('FileContent','NoFile')
}

Else 

{

$api.LogScriptEvent('Check File Contents = ',40,0,$Value)
$Value = Get-Content $Path
$bag.AddValue('FileContent',$Value)

}

#Return property bag
$bag

# Testing
# $api.Return($bag)

