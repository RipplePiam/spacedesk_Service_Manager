@echo off
chcp 65001 > nul
title spacedesk Service Manager(Copyright©2021 Cherry_ChenNan)

%1 %2
ver|find "5.">nul&&goto :Admin
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :Admin","","runas",1)(window.close)&goto :eof
:Admin

echo.
echo Checking local spacedesk Service Status...
echo.

set status=1
(tasklist|find /i "spacedeskService.exe" || set status=0 ) 2>nul 1>nul

if %status% == 1 (goto Running) else (goto Stopped)

:Running
	set command=
    echo spacedesk Service is now running.
    echo.
    set /p command=Do you want to stop spacedesk local Service(y/n):
	echo.
    if /i %command% == y (net stop spacedeskService)
	goto End

:Stopped
    set command=
    echo spacedesk Service is now stopped.
	echo.
    set /p command=Do you want to start spacedesk local Service?(y/n):
	echo.
	if /i %command% == y (net start spacedeskService)
	goto End

:End
echo.
echo Thank you for using this batch.
echo.
pause