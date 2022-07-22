#tear down container while testing 
#docker rm /mc

# start docker if not running
$PSScriptRoot
& "$PSScriptRoot\helper_scripts\start_docker.ps1"

# i guess this is intended to fail if mc is already created\
#replace this line with line calling docker compose
#TODO: fail with a good error message or just call start and exit
#accept eula
docker run -e EULA=TRUE -d -p 25565:25565 --name mc itzg/minecraft-server

#need to call docker volume create minecraftdata
docker-compose up -d --force-recreate
#upload desired world if present
#ask for confirmation
Write-Output "Paste in world folder into upload_world"
$uploadTrue= Read-Host -Prompt "Type y to upload world file"

if("y" -eq $uploadTrue)
{
    $PSScriptRoot
    & "$PSScriptRoot\helper_scripts\upload_world.ps1"
}

