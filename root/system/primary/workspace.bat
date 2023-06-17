cls&title %0&color b0&mode 110,35
setlocal enabledelayedexpansion
set n=1
set "put=true"
dir /b root\accounts\%USER%\workspace>"root\accounts\%USER%\workspace\"list

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:main
cls
dir /b /w root\accounts\%USER%\workspace
type root\gui-s\workS.txt
set "pat4=root\accounts\%USER%\workspace\list"
for /f %%a in (!pat4!) do (
	set arr[!n!]=%%a
	call :sets
)
set arr.len=!n!
goto :chos

:sets
goto :EOF

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:chos
if "!set!"=="true" set n=0
REM call "!Prompt.Laps!"nLine.lap
echo.
choice /c aseo /m "Scegli [selected : !n!,!set!] : " /n
set answer=%errorlevel%
if "%answer%"=="1" (
	set /a n=!n!+1
	echo !n!
	set put=false
	goto :main
)
if "%answer%"=="2" (
	set set selected=!arr[%n%]!
) 
if "%answer%"=="3" exit /b
if "%answer%"=="4" (
	set open=!arr[%n%]!
	
	echo !open!
	
	pause>nul
)

:END
color 0c
pause>nul