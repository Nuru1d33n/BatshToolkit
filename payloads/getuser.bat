@echo off
for /f "tokens=*" %%A in ('whoami') do set CURRENT_USER=%%A
echo Current User: %CURRENT_USER%
pause
