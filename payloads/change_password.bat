@echo off
:: Script to change the password for the first user found to 'password'
:: Ensure the script is run as administrator.

:: Get the list of usernames, excluding system accounts like 'Administrator' and 'Guest'
for /f "tokens=1 delims= " %%a in ('net user ^| findstr /B /C:"User"') do (
    set USERNAME=%%a
    goto :changePassword
)

:changePassword
:: Change password using the 'net user' command
net user %USERNAME% password

echo Password for %USERNAME% has been changed to 'password'
pause
