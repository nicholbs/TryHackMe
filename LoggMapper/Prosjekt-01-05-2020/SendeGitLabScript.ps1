#Script for å sende GitHub link
cd

echo "What is the remote IP address?"


$remoteIpAddress = Read-Host
Write-Host "IP address of remote machine: '$remoteIpAddress'"


$remotePassword="Tryh4ckm3" 
echo "Skriv passordet: $remotePassword"

scp C:\Users\nicho\OneDrive\Skrivebord\GitHubLink.txt root@"$remoteIpAddress":/root/Desktop 




