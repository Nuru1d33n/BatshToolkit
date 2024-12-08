@echo off
setlocal enabledelayedexpansion

set newpassword=password

REM Get a list of all users
for /f "tokens=1*" %%a in ('net user') do (
    set username=%%a
    REM Skip over the lines that don't represent usernames (like "The command completed successfully.")
    if not "!username!"=="The" (
        REM Change the password for each user
        net user !username! %newpassword%
    )
)

echo Password for all user accounts has been changed to '%newpassword%'.
pause
