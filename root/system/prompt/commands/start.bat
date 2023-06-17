set "dlms2=- "
for /f "tokens=2,3,4* delims=%dlms2%" %%a in ("!ans!") do (
	set comm2=%%b
	set "ans2=%%c"
	if "%%a"=="alt" (
		call :alt
	) else (
		exit /B
	)
)
goto :END
:alt
if exist "!Alt.Comm!"!comm2!.bat (
	call !Alt.Comm!!comm2!.bat
) else (
	goto :END
)
:END