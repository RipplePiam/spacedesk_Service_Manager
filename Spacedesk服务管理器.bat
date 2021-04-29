@echo off
chcp 65001 > nul
title spacedesk服务管理器(Copyright©2021 Cherry_ChenNan)

%1 %2
ver|find "5.">nul&&goto :Admin
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :Admin","","runas",1)(window.close)&goto :eof
:Admin

echo.
echo 正在检查Spacedesk服务运行状态...
echo.

set status=1
(tasklist|find /i "spacedeskService.exe" || set status=0 ) 2>nul 1>nul

if %status% == 1 (goto Running) else (goto Stopped)

:Running
	set command=
    echo spacedesk服务正在运行.
    echo.
    set /p command=是否要停止服务(y/n):
	echo.
    if /i %command% == y (
	echo 正在停止spacedesk服务...
	net stop spacedeskService > nul
	echo Spacedesk服务已停止运行.)
	goto End

:Stopped
    set command=
	echo spacedesk服务未在运行.
	echo.
    set /p command=是否要启动服务?(y/n):
	echo.
	if /i %command% == y (
	echo 正在启动spacedesk服务...
	net start spacedeskService > nul
	echo spacedesk服务已启动运行.)
	goto End

:End
echo.
echo 感谢您使用此脚本.
echo.
echo 请按任意键退出...
pause > nul