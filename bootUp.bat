@echo off&title Booting Up . . .&cls
setlocal enabledelayedexpansion
if exist "root\system\primary\"ini.bat (call "root\system\primary\"ini.bat) else (goto :BSOD)
set EOF=false
set output=OK
set ERROR=false
call !Sys.Prim!check.bat
set ERRLVL=%errorlevel%
(
	echo. 
	echo.
	echo.
	echo ---------------------------------
	echo -  Press any key to start . . . -
	echo ---------------------------------
	echo.
	echo.
	echo.

)
pause>nul
if "%ERRLVL%"=="90" goto BSOD
title Booting Up . . .
color 07
:welTxt
cls
echo.
echo.
echo.
echo.
type "root\gui-s\"wel.txt
echo.
echo.
timeout /t 1 >nul
if "%EOF%"=="TRUE" goto :EOF


color 0f
set "EOF=TRUE"
call :welTxt
color 0a
call :welTxt
color 0f
call :welTxt

call !Sys.Prim!ini.bat
call !Sys.Prim!login.bat
call !Sys.Prim!deskt.bat

:BSOD
color 9e
cls
echo.
echo Something gone wrong.
echo.
choice /c yn /m "Restart?"
if "%errorlevel%"=="1" call root\system\primary\reboot.bat
if "%errorlevel%"=="2" exit
goto :BSOD