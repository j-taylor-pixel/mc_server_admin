#upload desired world if present
#ask for confirmation
Write-Output "Paste in world folder into upload_world"
$uploadTrue= Read-Host -Prompt "Type y to upload world file"

if("y" -eq $uploadTrue)
{
    #this might not need to be factored out if it isnt used anywhere else
    $PSScriptRoot

    & "$PSScriptRoot\helper_scripts\upload_world.ps1"
    
}