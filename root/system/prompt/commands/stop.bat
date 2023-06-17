SETLOCAL
set "dlms2='"
for /f "tokens=2,3* delims=%dlms2%" %%a in ("!ans!") do (
	if "%%a"=="/n" set A.state=undef
	if "%%a"=="" set A.state=undef
	if "%%b"=="" set B.state=undef
	set "A.string=%%a"
	set "B.string=%%b"
	call :check
)
goto :END
:check
if not "!A.state!"=="undef" (
	if "!B.string!"==" _" (
		echo !A.string!
		pause>nul
	) else (
		if not "!B.string!"==" _" (
			echo !A.string!
			pause>nul
			echo.
		)
	)
) else (
	if "!A.state!"=="undef" (
		if "!B.string!"==" _" (
			pause>nul
		) else (
			::if not "!B.string!"==" _" (
			pause>nul
			echo.
			
		)
	)
)
	
ENDLOCAL
goto :END
:END
exit/b