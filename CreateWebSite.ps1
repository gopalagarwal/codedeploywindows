Try
{
    New-WebSite -Name server1 -Port 1111 -PhysicalPath 'c:\inetpub\wwwroot\MusicWorld' -Force
    netsh advfirewall firewall add rule name='Open Port 1111' dir=in action=allow protocol=TCP localport=1111
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
    "This script made a read attempt at $Time, ERROR_LR $ErrorMessage, FAILED_LR $FailedItem" | out-file c:\logs\CreateScript.log -append
}
