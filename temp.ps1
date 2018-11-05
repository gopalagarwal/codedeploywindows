mkdir 'C:\tempfolder' 
$target = "C:\inetpub\wwwroot\MusicWorld\" 
mkdir 'C:\SA1'
function DeleteIfExistsAndCreateEmptyFolder($dir )
{
    if ( Test-Path $dir ) {    
           Get-ChildItem -Path  $dir -Force -Recurse | Remove-Item -force –recurse
           Remove-Item $dir -Force
    }
    New-Item -ItemType Directory -Force -Path $dir
}
# Clean up target directory
DeleteIfExistsAndCreateEmptyFolder($target )
mkdir 'C:\SA2'
# msdeploy creates a web artifact with multiple levels of folders. We only need the content 
# of the folder that has Web.config within it 
 
$path2 = "C:\temp\WebApp\MusicWorld\HelloGopal\*"

Copy-Item $path2 $target -recurse -force
mkdir 'C:\SA3'