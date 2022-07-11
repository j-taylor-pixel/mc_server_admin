# if docker not running, then start it

$dockerPSoutput = docker ps | Out-String

if (($dockerPSoutput.Split(" "))[0] -ne "CONTAINER"){
    #this means docker daemon is not running
    start-process -FilePath "Docker Desktop.exe" -WorkingDirectory "C:\Program Files\Docker\Docker"

    #wait until startup is ready
    while(($dockerPSoutput.Split(" "))[0] -ne "CONTAINER"){
        Write-Output "Sleeping while docker desktop is starting up"
        Start-sleep 1 #could adjust to reduce load
        $dockerPSoutput = docker ps | Out-String #refresh string
    }
}
