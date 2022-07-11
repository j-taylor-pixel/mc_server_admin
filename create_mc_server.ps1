# flag to do additional steps if testing

#$stage = "Testing"
$stage = "DontTearDownTesting"

# if docker not running, then start it
# this could be factored into another ps script for maintanability




#so we always start in an empty environment
#this doesnt really remove the container
if ("Testing" -eq $stage)
{
    #tear down container while testing 
    docker rm /mc
}

#accept eula
docker run -e EULA=TRUE -d -p 25565:25565 --name mc itzg/minecraft-server

