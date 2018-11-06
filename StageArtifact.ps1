$target = "C:\inetpub\wwwroot\MusicWorld\" 
function DeleteIfExistsAndCreateEmptyFolder($dir )
{
    if ( Test-Path $dir ) {    
           Get-ChildItem -Path  $dir -Force -Recurse | Remove-Item -force –recurse
           Remove-Item $dir -Force
    }
    New-Item -ItemType Directory -Force -Path $dir
}
DeleteIfExistsAndCreateEmptyFolder($target )
  
$path2 = "C:\temp\WebApp\MusicWorld\HelloGopal\*"

Copy-Item $path2 $target -recurse -force