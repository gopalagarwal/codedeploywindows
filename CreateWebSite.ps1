Try
{
    powershell.exe New-WebSite -Name server6 -Port 6666 -PhysicalPath 'C:\inetpub\wwwroot\MusicWorld' -Force
    powershell.exe netsh advfirewall firewall add rule name='Open Port 6666' dir=in action=allow protocol=TCP localport=6666
}
Catch
{
    $ErrorMessage = $_.Exception.Message
    $FailedItem = $_.Exception.ItemName
    Break
}
Finally
{
    $Time=Get-Date
    "This script made a read attempt at $Time, ERROR_LR $ErrorMessage, FAILED_LR $FailedItem" | out-file c:\\logs\\CreateScript.log -append
}
