# start docker if not running
$PSScriptRoot
& "$PSScriptRoot\helper_scripts\start_docker.ps1"

#start container
docker start mc
