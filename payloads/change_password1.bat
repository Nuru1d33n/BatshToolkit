@echo off
:: Script to change the password of the first user account found to 'password'
:: Ensure the script is run as Administrator

:: Use PowerShell to get the first user account (excluding system accounts)
for /f "delims=" %%a in ('powershell -command "Get-LocalUser | Where-Object {($_.Name -ne 'Administrator') -and ($_.Name -ne 'Guest')} | Select-Object -First 1 | ForEach-Object { $_.Name }"') do set USERNAME=%%a

:: Check if we found a username
if "%USERNAME%"=="" (
    echo No user found to change password for.
    pause
    exit /b
)

:: Change password using the 'net user' command
net user %USERNAME% password

echo Password for %USERNAME% has been changed to 'password'
pause
