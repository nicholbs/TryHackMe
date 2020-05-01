$html =@()		#Lager array html

$computerName = $env:COMPUTERNAME	#Computeren sitt navn

$html += "<h1>$computerName</h1>"	#Starten av html rapport skal ha header, tar første skuff

$services = Get-Service | Group-Object StartType | Sort-object Name	#Data for formatering, nemlig alle tjenester gruppert i start type 										#I tillegg sorter dem etter navn

foreach($startType in $services) {		#For hver start type av tjenestene
	$name = $startType.Name			#Hent ut navn
	$group = $startType.Group		#Hent ut start type
	
	$html += $group | select Name,DisplayName,StartType,Status | ConvertTo-Html -As Table -Fragment -PreContent "<h2>$name</h2>"
	#> Legg til i neste skuff tjenestene for gitt startType og konverter data til html
}

$date = Get-Date		#Hent dato
$user = $env:USERNAME		#Hent navn på bruker

$html += "<br><i>Run by $user at $date</i>"	#neste skuff legg til bruker og date og gjør det til Italic skriftType

ConvertTo-Html -Title 'Services' -Body $html | Out-File .\RapportAvTjenester.html	#Lag html siden med tittel services
											#Kroppen av rapport er array $html
											#Skriv rapporten til fil RapportAvTjenester.html 

start .\RapportAvTjenester.html