Try
{
    C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe New-WebSite -Name server126 -Port 3242 -PhysicalPath 'C:\inetpub\wwwroot\MusicWorld' -Force
    C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe netsh advfirewall firewall add rule name='Open Port 3242' dir=in action=allow protocol=TCP localport=3242
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
