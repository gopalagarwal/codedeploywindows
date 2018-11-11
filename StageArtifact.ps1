Try
{
    $target = "C:\\inetpub\\wwwroot\\MusicWorld\\" 
    function DeleteIfExistsAndCreateEmptyFolder($dir )
    {
        if ( Test-Path $dir ) {    
                Get-ChildItem -Path  $dir -Force -Recurse | Remove-Item -force –recurse
                Remove-Item $dir -Force
        }
        New-Item -ItemType Directory -Force -Path $dir
    }

    DeleteIfExistsAndCreateEmptyFolder($target )
    
    $path2 = "C:\\temp\\WebApp\\MusicWorld\\HelloGopal\\*"

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
