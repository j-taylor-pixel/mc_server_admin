
#download file world

Set-Location .. #need to move out of helpers into MCServeradmin

$timestamp = Get-Date -Format o | ForEach-Object { $_ -replace ":", "." }

$folder = "./world_saves/data" + $timestamp

docker cp mc:/data $folder

# do /data/world to just get the world, otherwise everything is needed to spin up an identical server

