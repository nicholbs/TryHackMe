#Script for å sende GitHub link

echo "What is the remote IP address?"				#Veiledende

$remoteIpAddress = Read-Host					#Input fra bruker
Write-Host "IP address of remote machine: '$remoteIpAddress'"	#Veiledende


scp C:\Users\nicho\OneDrive\Skrivebord\GitHubLink.txt root@"$remoteIpAddress":/root/Desktop 	#Send mitt document til remote Kali maskin






