# stage var to do additional steps if testing
#$stage = "Testing"
$stage = "DontTearDownTesting"

#so we always start in an empty environment
if ("Testing" -eq $stage)
{
    #tear down container while testing 
    docker rm /mc
}

# i guess this should fail if mc is already created
#accept eula
docker run -e EULA=TRUE -d -p 25565:25565 --name mc itzg/minecraft-server

#upload desired world if present
#ask for confirmation
Write-Output "Paste in world folder into upload_world"
$uploadTrue= Read-Host -Prompt "Type y to upload world file"

if("y" -eq $uploadTrue)
{
    #this might not need to be factored out if it isnt used anywhere else
    $PSScriptRoot

    & "$PSScriptRoot\helper_scripts\upload_world.ps1"
    
    # clear upload world folder
    #nah just do manually   
    #$uploadPath = PSScriptRoot\upload_world
    #Remove-Item -path $uploadPath -recurse
}

