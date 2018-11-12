#############################################
# am I running in 32 bit shell?
#############################################
if ($pshome -like "*syswow64*") {
 
    Write-Warning "Restarting script under 64 bit powershell"
   
    # relaunch this script under 64 bit shell
    & (join-path ($pshome -replace "syswow64", "sysnative") powershell.exe) -file `
      (join-path $psscriptroot $myinvocation.mycommand) @args
   
    # exit 32 bit script
    exit $lastexitcode
}
Try
{
    C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe New-WebSite -Name server5342 -Port 5342 -PhysicalPath 'C:\inetpub\wwwroot\MusicWorld' -Force
    C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe netsh advfirewall firewall add rule name='Open Port 5342' dir=in action=allow protocol=TCP localport=5342
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
