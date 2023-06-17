set n=0
for /f "tokens=2,3,4,5* delims=%dlms%" %%a in ("!ans!") do (
	set file1=%%a
	set mode=%%b
	set terzo=%%c
	if "%%b"=="arr" (
		set arrName=%%c
		call :inVar
	)
	if "%%b"=="file" (
		type %%a>%%c.%%d
	)
	if "%%b"=="norm" (
			type %%a
			if "!terzo!"=="_" (
				set space=true
			)
			if "!space!"=="true" echo.
		) else (
			if not "!terzo!"=="" (
				goto :for
				echo.
			)
		)
	)
)
goto :END
:for
for /l %%g in (1,1,!terzo!) do (
	type !file1!
	if "!space!"=="true" echo.
)
goto :EOF
:inVar
for /f "tokens=* delims=" %%a in (!file1!) do (
	set string=%%a
	call :sets
	set /a n=!n!+1
)
goto :EOF
:sets
set !terzo![%n%]=!string!
goto :EOF
:END
exit/b