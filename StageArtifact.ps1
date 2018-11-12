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
    Set-ExecutionPolicy RemoteSigned
    $target = "C:\inetpub\wwwroot\lr-api-v1\" 
    function DeleteIfExistsAndCreateEmptyFolder($dir )
    {
        if ( Test-Path $dir ) {    
                Get-ChildItem -Path  $dir -Force -Recurse | Remove-Item -force –recurse
                Remove-Item $dir -Force
        }
        New-Item -ItemType Directory -Force -Path $dir
    }

    DeleteIfExistsAndCreateEmptyFolder($target )
    
    $path2 = "C:\temp\WebApp\lr-api-v1\HelloGopal\*"

    Copy-Item $path2 $target -recurse -force
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
    "This script made a read attempt at $Time, ERROR_LR $ErrorMessage, FAILED_LR $FailedItem" | out-file c:\\logs\\StageScript.log -append
}
