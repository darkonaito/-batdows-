set "dlms2='^|"
for /f "tokens=2,3,4,5* delims=%dlms2%" %%a in ("!ans!") do (
	set string=%%a
	set times=%%b
	set var=%%c
	set file=%%d
	if "!times!"==" in" set %%c=%%a
	if "!times!"==" file" echo %%a>%%c.%%d
	call :check
)
goto :END
:check
if "%times%"=="" set times=1
set/a res=%times%+1
if not "%res%"=="1" call :timesCase
goto :EOF
:timesCase
if "%times%"=="" set times=1
for /l %%i in (1,1,%times%) do (
	if not "%string%"=="/" (
		echo %string%
	) else (
		if "%string%"=="/" (
			echo.
		)
	)
)
goto :EOF
:END
exit /b