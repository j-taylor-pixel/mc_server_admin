# start docker if not running
$PSScriptRoot
& "$PSScriptRoot\helper_scripts\start_docker.ps1"

#TODO: fail with a good error message if mc exists or just call start and exit
#docker run -e EULA=TRUE -d -p 25565:25565 --name mc itzg/minecraft-server

#need this for first time
mkdir Minecraft #create folder for volumes to live in
Set-Location Minecraft
docker volume create minecraftdata 
Set-Location .. #navigate back up 


docker-compose up -d --force-recreate # not sure if -p works

#upload desired world if present
Write-Output "Paste in world folder into upload_world"#ask for confirmation
$uploadTrue= Read-Host -Prompt "Type y to upload world file"

if("y" -eq $uploadTrue)
{
    #this might only work after the server is spinned up
    $PSScriptRoot
    & "$PSScriptRoot\helper_scripts\upload_world.ps1"
}

